###### Powered by  
![OutSystems][oslogo-image]

# outsystems-plugin-nativealert
Shows a native ios alert with a message passed as a parameter (iOS only)

[oslogo-image]:https://www.outsystems.com/-/media/themes/outsystems/website/site-theme/imgs/logo.svg


## Installation

Import the plugin using the following command:
```
$ cordova plugin add https://github.com/andregrillo/outsystems-plugin-nativealert.git
```

## Plugin method call

Call the showAlert method passing the string to be shown as a parameter:
```
cordova.plugins.NativeAlert.showAlert(function(){},function(){},"This is my alert message!");
```

#### Notes
> This plugin was created exclusively to the OutSystems Native Plugins Webinar for partners
