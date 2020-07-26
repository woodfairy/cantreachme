#import "WDFReachabilityController.h"
#import "../WDFReachabilityStrategy/WDFCoversheetStrategy.h"
#import "../WDFReachabilityStrategy/WDFControlCenterStrategy.h"
#import "../WDFReachabilityStrategy/WDFScreenshotStrategy.h"
#import "../WDFReachabilityStrategy/WDFDarkmodeStrategy.h"
#import "../WDFReachabilityStrategy/WDFAirplaneStrategy.h"
#import "../WDFReachabilityStrategy/WDFFleshlightStrategy.h"
#import "../WDFReachabilityStrategy/WDFBluetoothStrategy.h"
#import "../WDFReachabilityStrategy/WDFWifiStrategy.h"
#import "../WDFReachabilityStrategy/WDFLockStrategy.h"
#import "../WDFReachabilityStrategy/WDFLowPowerStrategy.h"
#import "../WDFReachabilityStrategy/WDFRecentStrategy.h"
#import "../WDFReachabilityStrategy/WDFOrientationStrategy.h"

static WDFCoversheetStrategy *coversheetStrategy       = [[WDFCoversheetStrategy alloc] init];
static WDFControlCenterStrategy *controlcenterStrategy = [[WDFControlCenterStrategy alloc] init];
static WDFScreenshotStrategy *screenshotStrategy       = [[WDFScreenshotStrategy alloc] init];
static WDFDarkmodeStrategy *darkmodeStrategy           = [[WDFDarkmodeStrategy alloc] init];
static WDFAirplaneStrategy *airplaneStrategy           = [[WDFAirplaneStrategy alloc] init];
static WDFFleshlightStrategy *fleshlightStrategy       = [[WDFFleshlightStrategy alloc] init];
static WDFBluetoothStrategy *bluetoothStrategy         = [[WDFBluetoothStrategy alloc] init];
static WDFWifiStrategy *wifiStrategy                   = [[WDFWifiStrategy alloc] init];
static WDFLockStrategy *lockStrategy                   = [[WDFLockStrategy alloc] init];
static WDFLowPowerStrategy *lpmStrategy                = [[WDFLowPowerStrategy alloc] init];
static WDFRecentStrategy *recentStrategy               = [[WDFRecentStrategy alloc] init];
static WDFOrientationStrategy *orientationStrategy     = [[WDFOrientationStrategy alloc] init];

@implementation WDFReachabilityController
-(void)coversheetAction {
    [coversheetStrategy run];
}

-(void)controlcenterAction {
    [controlcenterStrategy run];
}

-(void)screenshotAction:(SpringBoard *)sharedSpringboard {
    [screenshotStrategy run:sharedSpringboard];
}

-(void)darkmodeAction {
    [darkmodeStrategy run];
}

-(void)airplaneAction {
    [airplaneStrategy run];
}

-(void)fleshlightAction:(AVFlashlight *)sharedFleshlight {
    [fleshlightStrategy run:sharedFleshlight];
}

-(void)bluetoothAction {
    [bluetoothStrategy run];
}

-(void)wifiAction {
    [wifiStrategy run];
}

-(void)lockAction {
    [lockStrategy run];
}

-(void)lpmAction {
    [lpmStrategy run];
}

-(void)recentAction {
    [recentStrategy run];
}

-(void)orientationAction {
    [orientationStrategy run];
}
@end