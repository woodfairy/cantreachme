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


@interface SpringBoard

-(void)takeScreenshot;
-(void)takeScreenshotAndEdit:(BOOL)arg1;

@end