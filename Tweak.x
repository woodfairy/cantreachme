#import "Tweak.h"

static bool wdfTweakEnabled;
static NSString *wdfAction;

BOOL isSpringboard;
BOOL performAction       = YES;
SpringBoard *sb          = nil;
AVFlashlight *sharedFleshlight = nil;

void wdfTakeScreenshot() {
    if(!performAction) {
        NSLog(@"no screenshot will be taken");
    } else {
        NSLog(@"wdfTakeScreenshot runs");
        //dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [sb takeScreenshot];
        //});
    }
    // this works around an issue where _activateReachabiity is called twice for whatever reason. If you know why or you have a solution, please contact me or make a pull request.
    performAction = !performAction;
}

void wdfToggleFleshlight() {
    if(!performAction) {
        NSLog(@"flaslight won't be toggled");
    } else {
        [sharedFleshlight setFlashlightLevel: (sharedFleshlight.flashlightLevel > 0 ? 0.0 : 1.0) withError:nil];
    }

    performAction = !performAction;
}


%group CantReachMeSB

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)arg1 {
    %orig;
    sb = self;
    NSLog(@"SpringBoard applicationDidFinishLaunching runs");
    return;
}
%end

%end // group CantReachMeSB


%group CantReachMeAVFleshlight

%hook AVFlashlight
-(id)init {
    if(!sharedFleshlight) {
        sharedFleshlight = %orig;
    }

    return sharedFleshlight;
}
%end

%end // group CantReachMeAVFlashlight


%group CantReachMe

%hook SBReachabilityManager
-(void)_activateReachability:(id)arg1 {
    NSLog(@"_activateReachability");
    [self wdfPerformReachabilityAction];
    if(!wdfTweakEnabled) {
        %orig;
    }
}

-(void)toggleReachability {
    NSLog(@"toggleReachability");
    [self wdfPerformReachabilityAction];
    if(!wdfTweakEnabled) {
        %orig;
    }
}

%new
-(void)wdfPerformReachabilityAction {
    NSLog(@"wdfPerformReachabilityAction");
    if(wdfTweakEnabled) {
	if([wdfAction isEqual:@"coversheet"]) {
		    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
	    } else if ([wdfAction isEqual:@"controlcenter"]) {
		    [[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
	    } else if ([wdfAction isEqual:@"screenshot"]) {
            CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"0xcc.woodfairy.cantreachme/Screenshot", nil, nil, true);
        } else if ([wdfAction isEqual:@"darkmode"]) {
            [[%c(UIUserInterfaceStyleArbiter) sharedInstance] toggleCurrentStyle];
        } else if([wdfAction isEqual:@"airplane"]) {
            BOOL isInAirplaneMode = [[%c(SBAirplaneModeController) sharedInstance] isInAirplaneMode];
            [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:!isInAirplaneMode];
        } else if([wdfAction isEqual:@"fleshlight"]) {
            wdfToggleFleshlight();
        }
    }
}
%end

%end // group CantReachMe

void wdfReloadPrefs() {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"0xcc.woodfairy.cantreachme"];
    id isEnabled                 = [bundleDefaults valueForKey:@"Enabled"];
    wdfTweakEnabled              = isEnabled ? [isEnabled boolValue] : YES;
    wdfAction                    = [bundleDefaults valueForKey:@"crm_action"] ?: @"coversheet";
}

%ctor {
    NSArray *blacklist = @[
        @"backboardd",
        @"duetexpertd",
        @"lsd",
        @"nsurlsessiond",
        @"assertiond",
        @"ScreenshotServicesService",
        @"com.apple.datamigrator",
        @"CircleJoinRequested",
        @"nanotimekitcompaniond",
        @"ReportCrash",
        @"ptpd"
    ];

    NSString *processName = [NSProcessInfo processInfo].processName;

    for (NSString *process in blacklist) {
        if ([process isEqualToString:processName]) {
            return;
        }
    }

    isSpringboard = [@"SpringBoard" isEqualToString:processName];

    // I have taken this code from Nepetas SwipeShot
    // Someone smarter than me invented this.
    // https://www.reddit.com/r/jailbreak/comments/4yz5v5/questionremote_messages_not_enabling/d6rlh88/
    bool shouldLoad = NO;
    NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
    NSUInteger count = args.count;
    if (count != 0) {
        NSString *executablePath  = args[0];
        if (executablePath) {
            NSString *processName = [executablePath lastPathComponent];
            BOOL isApplication    = [executablePath rangeOfString:@"/Application/"].location != NSNotFound || [executablePath rangeOfString:@"/Applications/"].location != NSNotFound;
            BOOL isFileProvider   = [[processName lowercaseString] rangeOfString:@"fileprovider"].location != NSNotFound;
            BOOL skip = [processName isEqualToString:@"AdSheet"]
                        || [processName isEqualToString:@"CoreAuthUI"]
                        || [processName isEqualToString:@"InCallService"]
                        || [processName isEqualToString:@"MessagesNotificationViewService"]
                        || [executablePath rangeOfString:@".appex/"].location != NSNotFound;
            if ((!isFileProvider && isApplication && !skip) || isSpringboard) {
                shouldLoad = YES;
            }
        }
    }

    if (!shouldLoad) return;

    if (isSpringboard) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)wdfTakeScreenshot, (CFStringRef)@"0xcc.woodfairy.cantreachme/Screenshot", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
        %init(CantReachMeSB);
    }

    wdfReloadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, wdfReloadPrefs, CFSTR("0xcc.woodfairy.cantreachme/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);

    %init(CantReachMe)
    %init(CantReachMeAVFleshlight)
}

