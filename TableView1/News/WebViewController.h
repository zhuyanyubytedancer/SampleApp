//
//  WebViewController.h
//  TableView1
//
//  Created by bytedance on 2020/4/20.
//  Copyright © 2020 df. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol WebViewControllerProtocol <NSObject>



- (__kindof UIViewController *)WebViewControllerWithUrl:(NSString *)detailUrl;

@end


@interface WebViewController : UIViewController

- (id)initWithUrlString:(NSString*) urlString;

@end

NS_ASSUME_NONNULL_END

