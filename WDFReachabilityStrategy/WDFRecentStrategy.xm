#import "WDFRecentStrategy.h"

@implementation WDFRecentStrategy
-(void)run {
    [[%c(SBMainSwitcherViewController) sharedInstance] programmaticSwitchAppGestureMoveToRight];
}
@end