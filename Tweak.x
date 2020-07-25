#import "Tweak.h"
#import "CantReachMe/WDFReachabilityController.h"

static bool wdfTweakEnabled;
static NSString *wdfAction;

BOOL isSpringboard;
SpringBoard *sb                = nil;
AVFlashlight *sharedFleshlight = nil;
WDFReachabilityController *wdfReachabilityController;

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
    [self wdfPerformReachabilityAction:YES];
    if(!wdfTweakEnabled) {
        %orig;
    }
}

-(void)toggleReachability {
    NSLog(@"toggleReachability");
    [self wdfPerformReachabilityAction:NO];
    if(!wdfTweakEnabled) {
        %orig;
    }
}

%new
-(void)wdfPerformReachabilityAction:(BOOL)throttle {
    NSLog(@"wdfPerformReachabilityAction");
    if(wdfTweakEnabled) {
	    if([wdfAction isEqual:@"coversheet"]) {
            [wdfReachabilityController coversheetAction];
	    } else if ([wdfAction isEqual:@"controlcenter"]) {
            [wdfReachabilityController controlcenterAction];
	    } else if ([wdfAction isEqual:@"screenshot"]) {
            [wdfReachabilityController screenshotAction:sb throttle:throttle];
        } else if ([wdfAction isEqual:@"darkmode"]) {
            [wdfReachabilityController darkmodeAction];
        } else if([wdfAction isEqual:@"airplane"]) {
            [wdfReachabilityController airplaneAction];
        } else if([wdfAction isEqual:@"fleshlight"]) {
            [wdfReachabilityController fleshlightAction:sharedFleshlight throttle:throttle];
        } else if([wdfAction isEqual:@"bluetooth"]) {
            [wdfReachabilityController bluetoothAction:throttle];
        } else if([wdfAction isEqual:@"wifi"]) {
            [wdfReachabilityController wifiAction:throttle];
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
    wdfReachabilityController = [[WDFReachabilityController alloc] init];

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

    if (isSpringboard) %init(CantReachMeSB);

    wdfReloadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, wdfReloadPrefs, CFSTR("0xcc.woodfairy.cantreachme/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);

    %init(CantReachMe)
    %init(CantReachMeAVFleshlight)
}
