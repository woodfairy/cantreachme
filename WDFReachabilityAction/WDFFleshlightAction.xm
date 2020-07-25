#import "WDFFleshlightAction.h"

static BOOL performAction = YES;

@implementation WDFFleshlightAction
-(void) run:(AVFlashlight *)sharedFleshlight throttle:(BOOL)throttle {
    NSLog(@"run fleshlightAction");
    performAction = throttle ? performAction : !throttle;
    if(!performAction) {
        NSLog(@"fleshlight won't be toggled");
    } else {
        [sharedFleshlight setFlashlightLevel: (sharedFleshlight.flashlightLevel > 0 ? 0.0 : 1.0) withError:nil];
    }

    performAction = !performAction;
}
@end