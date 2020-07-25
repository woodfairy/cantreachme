#import "WDFScreenshotStrategy.h"

static BOOL performStrategy = YES;

@implementation WDFScreenshotStrategy
-(void) run:(SpringBoard *)sharedSpringboard throttle:(BOOL)throttle {
    NSLog(@"run screenshotStrategy");
    if(!performStrategy && throttle) {
        NSLog(@"screenshot won't be taken");
    } else {
        [sharedSpringboard takeScreenshot];
    }

    performStrategy = !performStrategy;
}
@end