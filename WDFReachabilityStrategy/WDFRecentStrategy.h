#import "WDFReachabilityStrategy.h"

@interface SBMainSwitcherViewController
+(id)sharedInstance;
-(void)programmaticSwitchAppGestureMoveToRight;
@end

@interface WDFRecentStrategy : WDFReachabilityStrategy
-(void)run;
@end