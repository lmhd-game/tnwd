// NativeURLHandler.mm
#import <UIKit/UIKit.h>

extern "C" {
    // 统一跳转方法（不使用 SFSafariViewController）
    void OpenURLCompat(const char *url) {
        NSString *urlStr = [NSString stringWithUTF8String:url];
        NSURL *nsUrl = [NSURL URLWithString:urlStr];
        
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:nsUrl 
                                                  options:@{}
                                        completionHandler:nil];
            } else {
                // iOS 9 及以下
                [[UIApplication sharedApplication] openURL:nsUrl];
            }
        
    }
}