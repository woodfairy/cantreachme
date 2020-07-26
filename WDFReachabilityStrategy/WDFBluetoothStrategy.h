#import "WDFReachabilityStrategy.h"

@interface BluetoothManager
+(BluetoothManager*)sharedInstance;
-(BOOL)powered;
-(void)setPowered:(BOOL)arg1;
-(void)_powerChanged;
@end

@interface WDFBluetoothStrategy : WDFReachabilityStrategy
-(void)run;
@end
