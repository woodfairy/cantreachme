#import "WDFScreenshotStrategy.h"
#import "../UIDevice+notchedDevice.h"

static BOOL performStrategy = YES;

@implementation WDFScreenshotStrategy
-(void) run:(SpringBoard *)sharedSpringboard {
    BOOL isNotched = [UIDevice.currentDevice isNotched];
    NSLog(@"run screenshotStrategy");
    if(!performStrategy && isNotched) {
        NSLog(@"screenshot won't be taken");
    } else {
        [sharedSpringboard takeScreenshot];
    }

    performStrategy = !performStrategy;
}
@end