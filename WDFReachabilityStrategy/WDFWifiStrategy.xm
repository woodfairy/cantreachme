#import "WDFWifiStrategy.h"


@implementation WDFWifiStrategy
-(void) run {
    BOOL isPowered = [[%c(WFClient) sharedInstance] powered];
    [[%c(WFClient) sharedInstance] setPowered:!isPowered];
}
@end