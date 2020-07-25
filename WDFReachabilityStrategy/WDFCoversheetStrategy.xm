#import "WDFCoversheetStrategy.h"

@implementation WDFCoversheetStrategy
-(void)run {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}
@end