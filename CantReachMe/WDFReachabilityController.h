#import "../WDFReachabilityStrategy/WDFFleshlightStrategy.h"
#import "../WDFReachabilityStrategy/WDFScreenshotStrategy.h"

@interface WDFReachabilityController : NSObject
-(void)coversheetAction;
-(void)controlcenterAction;
-(void)screenshotAction:(SpringBoard *)sharedSpringboard throttle:(BOOL)throttle;
-(void)darkmodeAction;
-(void)airplaneAction;
-(void)fleshlightAction:(AVFlashlight *)sharedFleshlight throttle:(BOOL)throttle;
-(void)bluetoothAction:(BOOL)throttle;
-(void)wifiAction:(BOOL)throttle;
@end