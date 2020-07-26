#import "WDFWifiStrategy.h"
#import "../UIDevice+notchedDevice.h"

static BOOL performStrategy = YES;

@implementation WDFWifiStrategy
-(void) run {
    BOOL isNotched = [UIDevice.currentDevice isNotched];
    if(!performStrategy && isNotched) {
        NSLog(@"wifi won't be toggled");
    } else {
        BOOL isPowered = [[%c(WFClient) sharedInstance] powered];
        [[%c(WFClient) sharedInstance] setPowered:!isPowered];
    }

    performStrategy = !performStrategy;
}
@end