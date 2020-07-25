#import "WDFCoversheetAction.h"

@implementation WDFCoversheetAction 
-(void)run {
    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
}
@end