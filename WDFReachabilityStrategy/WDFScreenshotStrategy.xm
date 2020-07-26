#import "WDFScreenshotStrategy.h"


@implementation WDFScreenshotStrategy
-(void) run:(SpringBoard *)sharedSpringboard {
    [sharedSpringboard takeScreenshot];
}
@end