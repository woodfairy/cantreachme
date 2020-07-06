%hook SBReachabilityManager

@interface SBCoverSheetPresentationManager
    +(id)sharedInstance;
    -(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

-(void) _activateReachability: (id)arg {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}

-(void) toggleReachability {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}

%end
