#import "WDFReachabilityStrategy.h"

@interface SBControlCenterController
+(id)sharedInstance;
+(void)presentAnimated:(BOOL)arg1;
@end

@interface WDFControlCenterStrategy : WDFReachabilityStrategy
-(void)run;
@end