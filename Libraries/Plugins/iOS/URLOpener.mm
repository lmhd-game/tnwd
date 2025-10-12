#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern "C" {
    // 检查 URL Scheme 是否可用
    BOOL CanOpenURL(const char *url) {
        NSString *urlStr = [NSString stringWithUTF8String:url];
        NSURL *nsUrl = [NSURL URLWithString:urlStr];
        return [[UIApplication sharedApplication] canOpenURL:nsUrl];
    }

    // 打开自定义 URL Scheme（如 weixin://）
    void OpenCustomURL(const char *url) {
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