#import "WDFAirplaneStrategy.h"

@implementation WDFAirplaneStrategy
-(void) run {
    SBAirplaneModeController *controller = [%c(SBAirplaneModeController) sharedInstance];
    BOOL isInAirplaneMode = [controller isInAirplaneMode];
    [controller setInAirplaneMode:!isInAirplaneMode];
}
@end