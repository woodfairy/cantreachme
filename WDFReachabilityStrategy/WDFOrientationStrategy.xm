#import "WDFOrientationStrategy.h"

@implementation WDFOrientationStrategy
-(void)run {
    SBOrientationLockManager *orientationManager = [%c(SBOrientationLockManager) sharedInstance];
    if ([orientationManager isUserLocked]) {
        [orientationManager unlock];
    } else {
        [orientationManager lock];
    }
}
@end