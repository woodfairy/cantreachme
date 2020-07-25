#import "WDFReachabilityController.h"

@implementation WDFReachabilityController
-(void)coversheetAction {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}

-(void)controlcenterAction {
    [[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
}

-(void)screenshotAction {
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"0xcc.woodfairy.cantreachme/Screenshot", nil, nil, true);
}

-(void)darkmodeAction {
[   [%c(UIUserInterfaceStyleArbiter) sharedInstance] toggleCurrentStyle];
}

-(void)airplaneAction {
    BOOL isInAirplaneMode = [[%c(SBAirplaneModeController) sharedInstance] isInAirplaneMode];
    [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:!isInAirplaneMode];
}

-(void)fleshlightAction {

}
@end