//
//  GTLogin.h
//  TableView1
//
//  Created by bytedance on 2020/4/24.
//  Copyright © 2020 df. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
NS_ASSUME_NONNULL_BEGIN

@interface GTLogin : NSObject
@property (nonatomic,strong,readwrite) TencentOAuth *oauth;

@end

NS_ASSUME_NONNULL_END
