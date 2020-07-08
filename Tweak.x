static bool wdfTweakEnabled;
static NSString *wdfAction;

BOOL Springboard *sb = nil;

@interface SBCoverSheetPresentationManager
+(id)sharedInstance;
-(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

@interface SBControlCenterController
+(id)sharedInstance;
+(void)presentAnimated:(BOOL)arg1;
@end

@interface SBReachabilityManager
-(void)_activateReachability:(id)arg1;
-(void)toggleReachability;
-(void)wdfPerformReachabilityAction;
@end

@interface SBScreenshotManager
-(void)saveScreenshots;
-(void)saveScreenshotsWithCompletion:(/*^block*/id)arg1;
@end

%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)arg1 {
    %orig;
    sb = self;
    return;
}


%end

%hook SBReachabilityManager
-(void)_activateReachability:(id)arg1 {
    [self wdfPerformReachabilityAction];
    if(!wdfTweakEnabled) {
        %orig;
    }
}

-(void)toggleReachability {
    [self wdfPerformReachabilityAction];
    if(!wdfTweakEnabled) {
        %orig;
    }
}

%new
-(void)wdfPerformReachabilityAction {
    if(wdfTweakEnabled) {
	if([wdfAction isEqual:@"coversheet"]) {
		[[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
	} else if ([wdfAction isEqual:@"controlcenter"]) {
		[[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
	} else if ([wdfAction isEqual:@"screenshot"]) {
                [[%c(SBScreenshotManager) sharedInstance] saveScreenshotsWithCompletion:nil];
        }
    }
}
%end
void wdfTakeScreenshot() {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITIY_DEFAULT, 0), ^{
        [sb takeScreenshot];
    });
}

void wdfReloadPrefs() {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"0xcc.woodfairy.cantreachme"];
    
    id isEnabled    = [bundleDefaults valueForKey:@"Enabled"];
    
    wdfTweakEnabled = [isEnabled isEqual:@1] ? YES : NO;
    wdfAction       = [bundleDefaults valueForKey:@"crm_action"];
}

%ctor {
    wdfReloadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, wdfReloadPrefs, CFSTR("0xcc.woodfairy.cantreachme/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}

