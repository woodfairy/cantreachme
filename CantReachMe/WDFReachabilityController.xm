#import "WDFReachabilityController.h"
#import "../WDFReachabilityAction/WDFCoversheetAction.h"
#import "../WDFReachabilityAction/WDFControlCenterAction.h"
#import "../WDFReachabilityAction/WDFDarkmodeAction.h"

static WDFCoversheetAction *coversheetAction       = [[WDFCoversheetAction alloc] init];
static WDFControlCenterAction *controlcenterAction = [[WDFControlCenterAction alloc] init];
static WDFDarkmodeAction *darkmodeAction           = [[WDFDarkmodeAction alloc] init];

@implementation WDFReachabilityController
-(void)coversheetAction {
    [coversheetAction run];
}

-(void)controlcenterAction {
    [controlcenterAction run];
}

-(void)screenshotAction {
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"0xcc.woodfairy.cantreachme/Screenshot", nil, nil, true);
}

-(void)darkmodeAction {
    [darkmodeAction run];
}

-(void)airplaneAction {
    BOOL isInAirplaneMode = [[%c(SBAirplaneModeController) sharedInstance] isInAirplaneMode];
    [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:!isInAirplaneMode];
}

-(void)fleshlightAction {

}
@end