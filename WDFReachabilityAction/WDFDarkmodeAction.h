#import "WDFReachabilityAction.h"

@interface UIUserInterfaceStyleArbiter
+(id)sharedInstance;
-(void)toggleCurrentStyle;
@end

@interface WDFDarkmodeAction : WDFReachabilityAction
-(void)run;
@end