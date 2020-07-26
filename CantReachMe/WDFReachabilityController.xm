#import "WDFReachabilityController.h"
#import "../WDFReachabilityStrategy/WDFReachabilityStrategies.h"

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
static WDFPlaybackStrategy *playbackStrategy           = [[WDFPlaybackStrategy alloc] init];

static NSDictionary *strategies = @{
    @"coversheet": coversheetStrategy,
    @"controlcenter": controlcenterStrategy,
    @"screenshot": screenshotStrategy,
    @"darkmode": darkmodeStrategy,
    @"airplane": airplaneStrategy,
    @"fleshlight": fleshlightStrategy,
    @"bluetooth": bluetoothStrategy,
    @"wifi":  wifiStrategy,
    @"lock": lockStrategy,
    @"lpm": lpmStrategy,
    @"recent": recentStrategy,
    @"orientation": orientationStrategy,
    @"playback": playbackStrategy
};

@implementation WDFReachabilityController
-(void)runStrategyForAction:(NSString *)action {
    WDFReachabilityStrategy *strategy = [strategies valueForKey:action];
    if(!strategy) return;
    [strategy run];
}
@end