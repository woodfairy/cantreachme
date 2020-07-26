#import "WDFLowPowerStrategy.h"
#import "../UIDevice+notchedDevice.h"

static BOOL performStrategy = YES;

@implementation WDFLowPowerStrategy
-(void)run {
    BOOL isNotched = [UIDevice.currentDevice isNotched];
    if(!performStrategy && isNotched) {
        NSLog(@"bluetooth won't be toggled");
    } else {
        BOOL isEnabled = [[NSProcessInfo processInfo] isLowPowerModeEnabled];
        [%c(PSLowPowerModeSettingsDetail) setEnabled:!isEnabled];
    }
    
    performStrategy = !performStrategy;
}
@end