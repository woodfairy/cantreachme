#import "WDFReachabilityStrategy.h"

@interface SBScreenshotManager
-(void)saveScreenshots;
-(void)saveScreenshotsWithCompletion:(/*^block*/id)arg1;
@end

@interface SpringBoard
-(void)takeScreenshot;
-(void)takeScreenshotAndEdit:(BOOL)arg1;
@end

@interface WDFScreenshotStrategy : WDFReachabilityStrategy
-(void)run:(SpringBoard *)sharedSpringboard throttle:(BOOL)throttle;
@end