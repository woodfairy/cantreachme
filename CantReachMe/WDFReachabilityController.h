#import "../WDFReachabilityAction/WDFFleshlightAction.h"

@interface SBScreenshotManager
-(void)saveScreenshots;
-(void)saveScreenshotsWithCompletion:(/*^block*/id)arg1;
@end

@interface SpringBoard
-(void)takeScreenshot;
-(void)takeScreenshotAndEdit:(BOOL)arg1;
@end

@interface BluetoothManager
+(BluetoothManager*)sharedInstance;
-(BOOL)powered;
-(void)setPowered:(BOOL)arg1;
-(void)_powerChanged;
@end

@interface WFClient
+(WFClient*)sharedInstance;
-(BOOL)powered;
-(void)setPowered:(BOOL)arg1;
@end

@interface WDFReachabilityController : NSObject
-(void)coversheetAction;
-(void)controlcenterAction;
-(void)screenshotAction;
-(void)darkmodeAction;
-(void)airplaneAction;
-(void)fleshlightAction:(AVFlashlight *)sharedFleshlight throttle:(BOOL)throttle;
@end