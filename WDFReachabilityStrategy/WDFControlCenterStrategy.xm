#import "WDFControlCenterStrategy.h"

@implementation WDFControlCenterStrategy
-(void)run {
    [[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
}
@end