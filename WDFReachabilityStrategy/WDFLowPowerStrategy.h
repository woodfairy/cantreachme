#import "WDFReachabilityStrategy.h"

@interface PSLowPowerModeSettingsDetail
+(void)setEnabled:(BOOL)arg1;
@end

@interface WDFLowPowerStrategy : WDFReachabilityStrategy
-(void)run;
@end