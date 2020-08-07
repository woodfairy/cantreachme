#import "Tweak.h"
#import "CantReachMe/WDFReachabilityController.h"

static bool wdfTweakEnabled;
static NSString *wdfAction;

BOOL performAction = YES;
WDFReachabilityController *wdfReachabilityController;

%group CantReachMe
%hook SBReachabilityManager
-(void)_activateReachability:(id)arg1 {
    NSLog(@"_activateReachability");
    if(wdfTweakEnabled) {
        if(performAction)
            [self wdfPerformReachabilityAction];
        performAction = !performAction;
    } else {
        %orig;
    }
}

-(void)toggleReachability {
    NSLog(@"toggleReachability");
    if(wdfTweakEnabled)
        [self wdfPerformReachabilityAction];
    else
        %orig;
}

%new
-(void)wdfPerformReachabilityAction {
    NSLog(@"wdfPerformReachabilityAction");
    [wdfReachabilityController runStrategyForAction:wdfAction];
}
%end
%end // group CantReachMe

void wdfReloadPrefs() {
    NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"0xcc.woodfairy.cantreachme"];
    id isEnabled                 = [bundleDefaults valueForKey:@"Enabled"];
    wdfTweakEnabled              = isEnabled ? [isEnabled boolValue] : YES;
    wdfAction                    = [bundleDefaults valueForKey:@"crm_action"] ?: @"coversheet";
}

%ctor {
    wdfReachabilityController = [[WDFReachabilityController alloc] init];
    wdfReloadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, wdfReloadPrefs, CFSTR("0xcc.woodfairy.cantreachme/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    %init(CantReachMe)
}
