//
//  AppDelegate.m
//  TableView1
//
//  Created by bytedance on 2020/4/19.
//  Copyright © 2020 df. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "videoViewController.h"
#import "GTNewsViewController.h"
#import "TeamViewController.h"
#import "RefreshControllerView.h"
#import "SplashView.h"
#import "MineViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    
    ViewController* musicController = [[ViewController alloc] init];
    musicController.tabBarItem.title = @"音乐";
    
    videoViewController* videoController = [[videoViewController alloc] init];
    videoController.tabBarItem.title = @"视频";
    
    GTNewsViewController* newsController = [[GTNewsViewController alloc] init];
    newsController.tabBarItem.title = @"新闻";
    
    TeamViewController* teamViewController = [[TeamViewController alloc] init];
    teamViewController.tabBarItem.title = @"球队";
    
    MineViewController* mineViewController=[[MineViewController alloc] init];
    mineViewController.tabBarItem.title=@"我的";
    
    
    
    tabBarController.viewControllers = @[newsController,videoController,musicController,teamViewController,mineViewController];
    
    self.window.rootViewController = navigationController;
    

    
    [self.window makeKeyAndVisible];
    
    
    
    //可以做广告页面的处理逻辑
    //splashView为广告页面，点击广告跳转到广告APP，点击跳过进入主页面
    SplashView* splashView = [[SplashView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self.window addSubview:splashView];
   
    
    return YES;
}


//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
