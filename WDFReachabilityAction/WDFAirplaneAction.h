#import "WDFReachabilityAction.h"

@interface SBAirplaneModeController
+(id)sharedInstance;
-(BOOL)isInAirplaneMode;
-(void)setInAirplaneMode:(BOOL)arg1;
@end

@interface WDFAirplaneAction : WDFReachabilityAction
-(void)run;
@end