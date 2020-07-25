#import "WDFReachabilityAction.h"

@interface SBControlCenterController
+(id)sharedInstance;
+(void)presentAnimated:(BOOL)arg1;
@end

@interface WDFControlCenterAction : WDFReachabilityAction
-(void)run;
@end