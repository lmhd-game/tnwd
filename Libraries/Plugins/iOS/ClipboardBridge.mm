#import <UIKit/UIKit.h>

extern "C" {
    void _copyTextToClipboard(const char *text) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = [NSString stringWithUTF8String:text];
    }

    void _showAlert(const char *title, const char *message) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithUTF8String:title]
                                                                      message:[NSString stringWithUTF8String:message]
                                                               preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        
        UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        [rootViewController presentViewController:alert animated:YES completion:nil];
    }
}