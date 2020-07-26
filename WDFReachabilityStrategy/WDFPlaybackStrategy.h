#import "WDFReachabilityStrategy.h"

@interface SBMediaController
+(id)sharedInstance;
-(BOOL)isPlaying;
-(BOOL)playForEventSource:(long long)arg1 ;
-(BOOL)pauseForEventSource:(long long)arg1 ;
@end

@interface WDFPlaybackStrategy : WDFReachabilityStrategy
-(void)run;
@end