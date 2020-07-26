#import "WDFWifiStrategy.h"


@implementation WDFWifiStrategy
-(void) run {
    WFClient *wfClient = [%c(WFClient) sharedInstance];
    BOOL isPowered = [wfClient powered];
    [wfClient setPowered:!isPowered];
}
@end