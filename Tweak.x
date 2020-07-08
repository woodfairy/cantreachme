static bool wdfTweakEnabled;
static NSString *wdfAction;

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
	}
    }
}
%end

void wdfReloadPrefs() {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"0xcc.woodfairy.cantreachme"];
    
    id isEnabled    = [bundleDefaults valueForKey:@"Enabled"];
    
    wdfTweakEnabled = isEnabled ? [isEnabled boolValue] : YES;
    wdfAction       = [bundleDefaults valueForKey:@"crm_action"] ?: @"coversheet";
}

%ctor {
    wdfReloadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, wdfReloadPrefs, CFSTR("0xcc.woodfairy.cantreachme/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}

