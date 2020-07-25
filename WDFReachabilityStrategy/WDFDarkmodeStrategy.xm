#import "WDFDarkmodeStrategy.h"

@implementation WDFDarkmodeStrategy
-(void)run {
    [[%c(UIUserInterfaceStyleArbiter) sharedInstance] toggleCurrentStyle];
}
@end