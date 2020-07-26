#import "WDFReachabilityStrategy.h"

@interface AVFlashlight
-(id)init;
-(float)flashlightLevel;
-(BOOL)setFlashlightLevel:(float)arg1 withError:(id*)arg2;
@end

@interface WDFFleshlightStrategy : WDFReachabilityStrategy
-(void)run;
@end