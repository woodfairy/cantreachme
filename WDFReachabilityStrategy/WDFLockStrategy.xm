#import "WDFLockStrategy.h"
#import "../UIDevice+notchedDevice.h"

static BOOL performStrategy = YES;

@implementation WDFLockStrategy
-(void)run {
    BOOL isNotched = [UIDevice.currentDevice isNotched];
    if(!performStrategy && isNotched) {
        NSLog(@"device lock won't be toggled");
    } else {
        [((SpringBoard *)[%c(SpringBoard) sharedApplication]) _simulateLockButtonPress];
    }

    performStrategy = !performStrategy;
}
@end