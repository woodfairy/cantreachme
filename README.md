# CantReachMe

> Custom action for the reachability gesture on jailbroken iOS 13 devices.

### Currently supported actions:
 - Notification Center
 - Control Center
 - Screenshot
 - Dark Mode
 - Airplane Mode
 - Flashlight
 - Bluetooth
 - WiFi
 - Lock Device
 - Low Power Mode
 - Recent App (swipe left on bottom edge)
 - Orientation Lock
 - Play/Pause Media


### Making your own Strategy

CantReachMe provides an easy way to extend the tweak by your very own custom actions! And it's easy. You only need a few minutes to get started!
Let's make an example for a strategy that opens the Notification Center.

 **Create a strategy**<br>
You first have to create a strategy inside *WDFReachabilityStrategy/*<br>
We will create 2 files:<br>
 - WDFCoversheetStrategy.h (header file)
 - WDFCoversheetStrategy.xm

That's basically all we need to get started.<br>
First we define an interface:

    #import  "WDFReachabilityStrategy.h"
    
    @interface WDFCoversheetStrategy : WDFReachabilityStrategy
    -(void)run;
    @end
The interface WDFCoversheetStrategy inherits from WDFReachabilityStrategy which you have to import.<br>
You basically only need the method "run". There, the code for your custom action will live.<br><br>

As we want to open the Notification Center, we will have to add another interface to our header file:

    @interface SBCoverSheetPresentationManager
    +(id)sharedInstance;
    -(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
    @end
Once we have done this, we will take care of the implementation in *WDFCoversheetStrategy.xm*

    #import  "WDFCoversheetStrategy.h"
    
    @implementation  WDFCoversheetStrategy
    -(void)run {
	    [[%c(SBCoverSheetPresentationManager) sharedInstance] setCoverSheetPresented:YES animated:YES withCompletion:nil];
    }
    @end
As you can see, we have now implemented the "run" method. <br>
Now we need to add the headers of our new strategy to the Strategies headers which are imported from the controller later.<br>
It is named *WDFReachabilityStrategies.h*<br><br>
**Extend the controller**<br>
In order for it to work, we will need to extend the *WDFReachabilityController* located in *CantReachMe/*<br>
First, we will initialize the strategy:

    static WDFCoversheetStrategy *coversheetStrategy = [[WDFCoversheetStrategy alloc] init];

Now, we just need to add an entry to the NSDictionary containing all of our strategies:

    static NSDictionary *strategies = @{
            ...[more]
        @"coversheet": coversheetStrategy,
    };
**Add to preferences**<br>
The last thing left is to add the new strategy to our preferences. You can find the plist file in *Prefs/Resources/Root.plist*<br>
Add a new key (validTitles) and value (validValues) under the *crm_action* entry:

    <dict>
	    <key>cell</key>
	    <string>PSLinkListCell</string>
	    <key>defaults</key>
	    <string>0xcc.woodfairy.cantreachme</string>
	    <key>detail</key>
	    <string>PSListItemsController</string>
	    <key>key</key>
	    <string>crm_action</string>
	    <key>label</key>
	    <string>Action</string>
	    <key>PostNotification</key>
	    <string>0xcc.woodfairy.cantreachme/ReloadPrefs</string>
	    <key>validTitles</key>
	    <array>
			    ...[more]
            <string>Notification Center</string>
	    </array>
	    <key>validValues</key>
	    <array>
			    ...[more]
            <string>coversheet</string>
	    </array>
    </dict>
It is very important that the *value* entry matches the key of the NSDictionary in the *WDFReachabilityController*<br>
In our case:<br>
**coversheet**Action<br>
gets the value <br>
**coversheet**<br><br>

That's it! Now you have succesfully added a new action! Feel free to contribute!