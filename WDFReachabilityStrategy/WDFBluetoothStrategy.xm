#import "WDFBluetoothStrategy.h"
#import "../UIDevice+notchedDevice.h"

static BOOL performStrategy = YES;

@implementation WDFBluetoothStrategy
-(void) run {
    BOOL isNotched = [UIDevice.currentDevice isNotched];
    if(!performStrategy && isNotched) {
        NSLog(@"bluetooth won't be toggled");
    } else {
        BOOL isPowered = [[%c(BluetoothManager) sharedInstance] powered];
        [[%c(BluetoothManager) sharedInstance] setPowered:!isPowered];
        [[%c(BluetoothManager) sharedInstance] _powerChanged];
    }

    performStrategy = !performStrategy;
}
@end