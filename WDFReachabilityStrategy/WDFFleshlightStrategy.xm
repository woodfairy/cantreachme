#import "WDFFleshlightStrategy.h"

static BOOL performStrategy = YES;

@implementation WDFFleshlightStrategy
-(void) run:(AVFlashlight *)sharedFleshlight throttle:(BOOL)throttle {
    NSLog(@"run fleshlightStrategy");
    if(!performStrategy && throttle) {
        NSLog(@"fleshlight won't be toggled");
    } else {
        [sharedFleshlight setFlashlightLevel: (sharedFleshlight.flashlightLevel > 0 ? 0.0 : 1.0) withError:nil];
    }

    performStrategy = !performStrategy;
}
@end