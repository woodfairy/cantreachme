#import "WDFReachabilityController.h"
#import "../WDFReachabilityStrategy/WDFReachabilityStrategies.h"

@implementation WDFReachabilityController
-(void)runStrategyForAction:(NSString *)action {
    NSString *prefix = @"WDF";
    NSString *suffix = @"Strategy";
    NSString *className = [[prefix stringByAppendingString:action] stringByAppendingString:suffix];
    WDFReachabilityStrategy *strategy =  [[NSClassFromString(className) alloc] init];
    if(!strategy) return;
    [strategy run];
}
@end