#import "WDFAirplaneStrategy.h"

@implementation WDFAirplaneStrategy
-(void) run {
    BOOL isInAirplaneMode = [[%c(SBAirplaneModeController) sharedInstance] isInAirplaneMode];
    [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:!isInAirplaneMode];
}
@end