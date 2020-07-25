#import "WDFAirplaneAction.h"

@implementation WDFAirplaneAction
-(void) run {
    BOOL isInAirplaneMode = [[%c(SBAirplaneModeController) sharedInstance] isInAirplaneMode];
    [[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:!isInAirplaneMode];
}
@end