#import "WDFFleshlightStrategy.h"
#import "../UIDevice+notchedDevice.h"

static BOOL performStrategy = YES;

@implementation WDFFleshlightStrategy
-(void) run:(AVFlashlight *)sharedFleshlight {
    NSLog(@"run fleshlightStrategy");
    if(!performStrategy && [UIDevice.currentDevice isNotched]) {
        NSLog(@"fleshlight won't be toggled");
    } else {
        [sharedFleshlight setFlashlightLevel: (sharedFleshlight.flashlightLevel > 0 ? 0.0 : 1.0) withError:nil];
    }

    performStrategy = !performStrategy;
}
@end