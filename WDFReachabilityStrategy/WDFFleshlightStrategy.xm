#import "WDFFleshlightStrategy.h"


@implementation WDFFleshlightStrategy
-(void) run:(AVFlashlight *)sharedFleshlight {
    [sharedFleshlight setFlashlightLevel: (sharedFleshlight.flashlightLevel > 0 ? 0.0 : 1.0) withError:nil];
}
@end