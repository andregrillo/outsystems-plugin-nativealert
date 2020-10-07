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
        //...
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
