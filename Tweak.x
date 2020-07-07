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
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"0xcc.woodfairy.cantreachme"];
    id isEnabled = [bundleDefaults valueForKey:@"Enabled"];
    if([isEnabled isEqual:@1]) {
	id action = [bundleDefaults valueForKey:@"crm_action"];
	if([action isEqual:@"coversheet"]) {
		[[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
	} else if ([action isEqual:@"controlcenter"]) {
		[[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
	}
    }
}

-(void)toggleReachability {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"0xcc.woodfairy.cantreachme"];
    id isEnabled = [bundleDefaults valueForKey:@"Enabled"];
    if([isEnabled isEqual:@1]) {
	id action = [bundleDefaults valueForKey:@"crm_action"];
	if([action isEqual:@"coversheet"]) {
		[[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
	} else if ([action isEqual:@"controlcenter"]) {
		[[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
	}
    }
}
%end


