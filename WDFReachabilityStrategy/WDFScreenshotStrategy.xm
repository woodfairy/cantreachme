#import "WDFScreenshotStrategy.h"


@implementation WDFScreenshotStrategy
-(void)run {
    [((SpringBoard *)[%c(SpringBoard) sharedApplication]) takeScreenshot];
    //[sharedSpringboard takeScreenshot];
}
@end