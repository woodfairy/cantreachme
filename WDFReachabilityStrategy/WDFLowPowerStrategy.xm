#import "WDFLowPowerStrategy.h"


@implementation WDFLowPowerStrategy
-(void)run {
    BOOL isEnabled = [[NSProcessInfo processInfo] isLowPowerModeEnabled];
    [%c(PSLowPowerModeSettingsDetail) setEnabled:!isEnabled];
}
@end