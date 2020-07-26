#import "WDFReachabilityStrategy.h"

@interface SBScreenshotManager
-(void)saveScreenshots;
-(void)saveScreenshotsWithCompletion:(/*^block*/id)arg1;
@end

@interface SpringBoard
-(void)takeScreenshot;
-(void)takeScreenshotAndEdit:(BOOL)arg1;
-(void)_simulateLockButtonPress;
@end

@interface WDFScreenshotStrategy : WDFReachabilityStrategy
-(void)run:(SpringBoard *)sharedSpringboard;
@end