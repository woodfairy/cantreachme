#import "WDFWifiStrategy.h"

static BOOL performStrategy = YES;

@implementation WDFWifiStrategy
-(void) run:(BOOL)throttle {
    if(!performStrategy && throttle) {
        NSLog(@"wifi won't be toggled");
    } else {
        BOOL isPowered = [[%c(WFClient) sharedInstance] powered];
        [[%c(WFClient) sharedInstance] setPowered:!isPowered];
    }

    performStrategy = !performStrategy;
}
@end