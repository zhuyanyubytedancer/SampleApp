//
//  GTLogin.m
//  TableView1
//
//  Created by bytedance on 2020/4/24.
//  Copyright © 2020 df. All rights reserved.
//

#import "GTLogin.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

@implementation GTLogin
+ (instancetype)sharedLogin {
    static GTLogin *login;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        login = [[GTLogin alloc] init];
    });
    return login;
}

- (instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}
@end
