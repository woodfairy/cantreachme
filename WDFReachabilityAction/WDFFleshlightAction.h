#import "WDFReachabilityAction.h"

@interface AVFlashlight
-(id)init;
-(float)flashlightLevel;
-(BOOL)setFlashlightLevel:(float)arg1 withError:(id*)arg2;
@end

@interface WDFFleshlightAction : WDFReachabilityAction
-(void)run:(AVFlashlight *)sharedFleshlight throttle:(BOOL)throttle;
@end