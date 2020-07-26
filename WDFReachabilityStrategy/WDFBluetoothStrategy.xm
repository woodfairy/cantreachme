#import "WDFBluetoothStrategy.h"

@implementation WDFBluetoothStrategy
-(void) run {
    BluetoothManager *bluetoothManager = [%c(BluetoothManager) sharedInstance];
    BOOL isPowered = [bluetoothManager powered];
    [bluetoothManager setPowered:!isPowered];
    [bluetoothManager _powerChanged];
}
@end