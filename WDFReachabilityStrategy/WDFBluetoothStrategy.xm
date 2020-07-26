#import "WDFBluetoothStrategy.h"

@implementation WDFBluetoothStrategy
-(void) run {
    BOOL isPowered = [[%c(BluetoothManager) sharedInstance] powered];
    [[%c(BluetoothManager) sharedInstance] setPowered:!isPowered];
    [[%c(BluetoothManager) sharedInstance] _powerChanged];
}
@end