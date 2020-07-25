#import "WDFReachabilityController.h"
#import "../WDFReachabilityStrategy/WDFCoversheetStrategy.h"
#import "../WDFReachabilityStrategy/WDFControlCenterStrategy.h"
#import "../WDFReachabilityStrategy/WDFScreenshotStrategy.h"
#import "../WDFReachabilityStrategy/WDFDarkmodeStrategy.h"
#import "../WDFReachabilityStrategy/WDFAirplaneStrategy.h"
#import "../WDFReachabilityStrategy/WDFFleshlightStrategy.h"
#import "../WDFReachabilityStrategy/WDFBluetoothStrategy.h"
#import "../WDFReachabilityStrategy/WDFWifiStrategy.h"

static WDFCoversheetStrategy *coversheetStrategy       = [[WDFCoversheetStrategy alloc] init];
static WDFControlCenterStrategy *controlcenterStrategy = [[WDFControlCenterStrategy alloc] init];
static WDFScreenshotStrategy *screenshotStrategy       = [[WDFScreenshotStrategy alloc] init];
static WDFDarkmodeStrategy *darkmodeStrategy           = [[WDFDarkmodeStrategy alloc] init];
static WDFAirplaneStrategy *airplaneStrategy           = [[WDFAirplaneStrategy alloc] init];
static WDFFleshlightStrategy *fleshlightStrategy       = [[WDFFleshlightStrategy alloc] init];
static WDFBluetoothStrategy *bluetoothStrategy         = [[WDFBluetoothStrategy alloc] init];
static WDFWifiStrategy *wifiStrategy                   = [[WDFWifiStrategy alloc] init];

@implementation WDFReachabilityController
-(void)coversheetAction {
    [coversheetStrategy run];
}

-(void)controlcenterAction {
    [controlcenterStrategy run];
}

-(void)screenshotAction:(SpringBoard *)sharedSpringboard throttle:(BOOL)throttle {
    [screenshotStrategy run:sharedSpringboard throttle:throttle];
}

-(void)darkmodeAction {
    [darkmodeStrategy run];
}

-(void)airplaneAction {
    [airplaneStrategy run];
}

-(void)fleshlightAction:(AVFlashlight *)sharedFleshlight throttle:(BOOL)throttle {
    [fleshlightStrategy run:sharedFleshlight throttle:throttle];
}

-(void)bluetoothAction:(BOOL)throttle {
    [bluetoothStrategy run:throttle];
}

-(void)wifiAction:(BOOL)throttle {
    [wifiStrategy run:throttle];
}
@end