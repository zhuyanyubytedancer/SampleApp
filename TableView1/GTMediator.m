//
//  GTMediator.m
//  TableView1
//
//  Created by bytedance on 2020/4/24.
//  Copyright © 2020 df. All rights reserved.
//

#import "GTMediator.h"
#import <UIKit/UIKit.h>
@implementation GTMediator

//通过runtime反射机制进行解耦
//不需要知道具体的类，根据类名获得class
+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString *)detailUrl{

    Class detailCls = NSClassFromString(@"WebViewController");
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    return controller;
}

//与app间使用URL Scheme方式跳转
//通过跳转表方式
//单例模式
+ (NSMutableDictionary *)mediatorCache{
    static NSMutableDictionary* cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (void)registerScheme:(NSString *)scheme processBlock:(GTMediatorProcessBlock)processBlock{
    if(scheme&&processBlock){
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params{
    GTMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if(block){
        block(params);
        
    }
}

//protocol class
+ (void)registerProtocol:(Protocol *) proto class:(Class)cls{
    if(proto && cls){
        [[[self class] mediatorCache] setObject:cls forKey:(proto)];
    }
}

+ (Class)classForProtocol:(Protocol *)proto{
    return [[[self class] mediatorCache] objectForKey:proto];
}
@end
