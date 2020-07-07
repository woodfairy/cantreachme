@interface SBCoverSheetPresentationManager
+(id)sharedInstance;
-(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

@interface SBLockScreenViewController : UIViewController
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
	}
    }
}
%end

%hook SBLockScreenViewController

-(void)viewWillAppear:(BOOL)arg1 {
    %orig;
    UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    [statusView setBackgroundColor: [UIColor blackColor]];
    
    UILabel *statusLabel = [[UILabel alloc] initWithFrame:statusView.frame];
    [statusLabel setTextColor:[UIColor whiteColor]];

    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"0xcc.woodfairy.cantreachme"];

    id isEnabled = [bundleDefaults valueForKey:@"Enabled"];
    statusLabel.text = ([isEnabled isEqual:@0]) ? @"OFF" : @"ON";

    [statusView addSubview:statusLabel];
    [self.view addSubview:statusView];
}
	
%end


