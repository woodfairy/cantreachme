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

%hook SBReachabilityManager
-(void)_activateReachability:(id)arg1 {
    if(wdfTweakEnabled) {
	if([wdfAction isEqual:@"coversheet"]) {
		[[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
	} else if ([wdfAction isEqual:@"controlcenter"]) {
		[[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
	}
    }
}

-(void)toggleReachability {
    if(wdfTweakEnabled) {
	if([wdfAction isEqual:@"coversheet"]) {
		[[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
	} else if ([wdfAction isEqual:@"controlcenter"]) {
		[[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
	}
    }
}

%new
-(void)performReachabilityAction {
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
    
    wdfTweakEnabled = [isEnabled isEqual:@1] ? YES : NO;
    wdfAction       = [bundleDefaults valueForKey:@"crm_action"];
}

%ctor {
    wdfReloadPrefs();
}

