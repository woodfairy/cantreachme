#import "WDFReachabilityStrategy.h"

@interface WFClient
+(WFClient*)sharedInstance;
-(BOOL)powered;
-(void)setPowered:(BOOL)arg1;
@end

@interface WDFWifiStrategy : WDFReachabilityStrategy
-(void)run;
@end
