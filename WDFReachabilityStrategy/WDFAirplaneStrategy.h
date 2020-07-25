#import "WDFReachabilityStrategy.h"

@interface SBAirplaneModeController
+(id)sharedInstance;
-(BOOL)isInAirplaneMode;
-(void)setInAirplaneMode:(BOOL)arg1;
@end

@interface WDFAirplaneStrategy : WDFReachabilityStrategy
-(void)run;
@end
