@interface SBCoverSheetPresentationManager
+(id)sharedInstance;
-(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

%hook SBReachabilityManager
-(void)_activateReachability:(id)arg1 {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}

-(void)toggleReachability {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}

-(NSDictionary)getPrefs() {
	NSDictionary *bundleDefaults = [[NSUSerDefaults standardUserDefaults]
	peristentForDomainName:@"0xcc.woodfairy.cantreachme"];
	
	return *bundleDefaults;
}

%end
