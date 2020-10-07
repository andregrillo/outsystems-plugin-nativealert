var exec = require('cordova/exec');

exports.showAlert = function (success, error, message) {
    exec(success, error, 'NativeAlert', 'showAlert', [message]);
};
