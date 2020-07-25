#import "WDFReachabilityController.h"
#import "../WDFReachabilityAction/WDFCoversheetAction.h"
#import "../WDFReachabilityAction/WDFControlCenterAction.h"
#import "../WDFReachabilityAction/WDFDarkmodeAction.h"
#import "../WDFReachabilityAction/WDFAirplaneAction.h"
#import "../WDFReachabilityAction/WDFFleshlightAction.h"

static WDFCoversheetAction *coversheetAction       = [[WDFCoversheetAction alloc] init];
static WDFControlCenterAction *controlcenterAction = [[WDFControlCenterAction alloc] init];
static WDFDarkmodeAction *darkmodeAction           = [[WDFDarkmodeAction alloc] init];
static WDFAirplaneAction *airplaneAction           = [[WDFAirplaneAction alloc] init];
static WDFFleshlightAction *fleshlightAction       = [[WDFFleshlightAction alloc] init];

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
    [airplaneAction run];
}

-(void)fleshlightAction:(AVFlashlight *)sharedFleshlight throttle:(BOOL)throttle{
    [fleshlightAction run:sharedFleshlight throttle:throttle];
}
@end