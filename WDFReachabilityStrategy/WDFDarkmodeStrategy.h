#import "WDFReachabilityStrategy.h"

@interface UIUserInterfaceStyleArbiter
+(id)sharedInstance;
-(void)toggleCurrentStyle;
@end

@interface WDFDarkmodeStrategy : WDFReachabilityStrategy
-(void)run;
@end