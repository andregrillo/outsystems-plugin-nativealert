/********* NativeAlert.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface NativeAlert : CDVPlugin {
  // Member variables go here.
}

- (void)showAlert:(CDVInvokedUrlCommand*)command;
@end

@implementation NativeAlert

- (void)showAlert:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* message = [command.arguments objectAtIndex:0];

    if (message != nil && [message length] > 0) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"My Plugin" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        
        //Add buttons
        UIAlertAction* yesButton = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
        {
            NSLog(@"you pressed Yes, please button");
            // call method whatever u need
        }];
        UIAlertAction* noButton = [UIAlertAction actionWithTitle:@"Cancel"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
        {
            NSLog(@"you pressed No, thanks button");
            // call method whatever u need
        }];
        [alertController addAction:yesButton];
        [alertController addAction:noButton];
        
        
        
        id rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        if([rootViewController isKindOfClass:[UINavigationController class]])
        {
            rootViewController = ((UINavigationController *)rootViewController).viewControllers.firstObject;
        }
        if([rootViewController isKindOfClass:[UITabBarController class]])
        {
            rootViewController = ((UITabBarController *)rootViewController).selectedViewController;
        }
        //...
        [rootViewController presentViewController:alertController animated:YES completion:nil];
        
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
