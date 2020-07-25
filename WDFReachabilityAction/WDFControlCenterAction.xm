#import "WDFControlCenterAction.h"

@implementation WDFControlCenterAction
-(void)run {
    [[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
}
@end