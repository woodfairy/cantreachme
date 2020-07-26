#import "WDFReachabilityStrategy.h"

@interface SBOrientationLockManager
+(id)sharedInstance;
-(void)lock;
-(void)unlock;
-(BOOL)isUserLocked;
@end

@interface WDFOrientationStrategy : WDFReachabilityStrategy
-(void)run;
@end