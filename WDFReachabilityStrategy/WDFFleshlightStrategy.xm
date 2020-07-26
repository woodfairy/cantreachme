#import "WDFFleshlightStrategy.h"

static AVFlashlight *sharedFleshlight;

%hook AVFlashlight
-(id)init {
    if (!sharedFleshlight) {
        sharedFleshlight = %orig;
    }
    return sharedFleshlight;
}
%end

@implementation WDFFleshlightStrategy
-(void)run {
    [sharedFleshlight setFlashlightLevel: (sharedFleshlight.flashlightLevel > 0 ? 0.0 : 1.0) withError:nil];
}
@end