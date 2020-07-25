#import "WDFReachabilityStrategy.h"

@interface SBCoverSheetPresentationManager
+(id)sharedInstance;
-(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

@interface WDFCoversheetStrategy : WDFReachabilityStrategy
-(void)run;
@end
