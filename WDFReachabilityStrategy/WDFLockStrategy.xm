#import "WDFLockStrategy.h"


@implementation WDFLockStrategy
-(void)run {
    [((SpringBoard *)[%c(SpringBoard) sharedApplication]) _simulateLockButtonPress];
}
@end