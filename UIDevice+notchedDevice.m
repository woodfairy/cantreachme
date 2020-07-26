#include "UIDevice+notchedDevice.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation UIDevice (notchedDevice) 

-(BOOL)isNotched {
    if([self isAnIpod]) { // iPad and iPod are not notched devices
        return NO;
    }
    LAContext *context = [[LAContext alloc] init];
    
    [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
    return context.biometryType == LABiometryTypeFaceID; // only devices with FaceID are notched atm (also the latest iPad PRO so that's why i added an iPad check)
}

-(BOOL)isAnIpod {
    NSString const *model = [UIDevice.currentDevice model]; // get the device model
    
    return ([model isEqualToString:@"iPod"]);
} 

@end