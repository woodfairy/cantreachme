#import "WDFPlaybackStrategy.h"

@implementation WDFPlaybackStrategy
-(void)run {
    SBMediaController *mediaController = [%c(SBMediaController) sharedInstance];
    if([mediaController isPlaying]) {
        [mediaController pauseForEventSource:1];
    } else {
        [mediaController playForEventSource:1];
    }
}
@end