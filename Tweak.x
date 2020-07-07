@interface SBCoverSheetPresentationManager
+(id)sharedInstance;
-(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

@interface SBLockScreenViewControllerBase : UIViewController
@end

%hook SBReachabilityManager
-(void)_activateReachability:(id)arg1 {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}

-(void)toggleReachability {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
    persistentDomainForName:@"0xcc.woodfairy.cantreachme"];
    id isEnabled = [bundleDefaults valueForKey:@"Enabled"];
    if([isEnabled isEqual:@0]) {
    	[[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
    }
}


%end

%hook SBLockScreenViewControllerBase

-(void)viewWillAppear:(BOOL)arg1 {
    %orig;
    UIView *statusView = [[UIView alloc] initWithFrame:GCRectMake(0, 0, 250, 250)];
    [statusView setBackgroundColor: [UIColow blackColor]];
    
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


