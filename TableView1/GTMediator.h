//
//  GTMediator.h
//  TableView1
//
//  Created by bytedance on 2020/4/24.
//  Copyright © 2020 df. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTMediator : NSObject


//采用target-action方式进行解耦
+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUr;
//urlscheme
typedef void(^GTMediatorProcessBlock)(NSDictionary* params);
+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

//class-protocol
+ (void)registerProtocol:(Protocol *) proto class:(Class)cls;
+ (Class)classForProtocol:(Protocol *)proto;
@end

NS_ASSUME_NONNULL_END
