#import "../WDFReachabilityStrategy/WDFFleshlightStrategy.h"
#import "../WDFReachabilityStrategy/WDFScreenshotStrategy.h"

@interface WDFReachabilityController : NSObject
-(void)coversheetAction;
-(void)controlcenterAction;
-(void)screenshotAction:(SpringBoard *)sharedSpringboard;
-(void)darkmodeAction;
-(void)airplaneAction;
-(void)fleshlightAction:(AVFlashlight *)sharedFleshlight;
-(void)bluetoothAction;
-(void)wifiAction;
-(void)lockAction;
-(void)recentAction;
-(void)orientationAction;
-(void)playbackAction;
@end