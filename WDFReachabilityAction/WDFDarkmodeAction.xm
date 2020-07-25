#import "WDFDarkmodeAction.h"

@implementation WDFDarkmodeAction
-(void)run {
    [[%c(UIUserInterfaceStyleArbiter) sharedInstance] toggleCurrentStyle];
}
@end