//
//  NewsLoader.m
//  TableView1
//
//  Created by bytedance on 2020/4/22.
//  Copyright © 2020 df. All rights reserved.
//

#import "NewsLoader.h"
#import <AFNetworking.h>
#import "NewsItem.h"
@class NewsItem;
@implementation NewsLoader
- (void)loadListDataWithFinshBlock:(NewsLoaderFinishBlock)finishBlock{
    
    
    
    NSArray *listData = [self _readDataFromLocal];
    if(listData){
        //if(finishBlock){
            finishBlock(YES,listData.copy);
        //}
    }
    
//     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//     //key=97ad001bfcc2082e2eeaf798bad3d54e
//    __weak typeof(self) wself = self;
//     [manager GET:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//         __strong typeof(self) strongSelf = wself;
//         NSArray *dictionarys = [[responseObject valueForKey:@"result"] valueForKey:@"data"];
//         NSDictionary *dictionary;
//         NSMutableArray *itemList = [[NSMutableArray alloc] init];
//         for(dictionary in dictionarys){
//             NewsItem* item = [[NewsItem alloc] init];
//             [item configWithDictionary:dictionary];
//             [itemList addObject:item];
//         }
//         //序列化，反序列化
//         [strongSelf _archiveListDataWithArray:itemList.copy];
//         //我们希望所有回调都是在主线程里的（线程间通信)
//         //将整个的回调放到主线程中来
//          //NSLog(@"");
//         dispatch_async(dispatch_get_main_queue(), ^{
//             if(finishBlock){
//                  finishBlock(YES,itemList.copy);
//             }
//             //NSLog(@"");
//         });
//         //完成请求->解析->回调
//
//
//     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//         NSLog(@"");
//     }];
}
//- (void)loadListDataWithFinshBlock:(NewsLoaderFinishBlock)finishBlock
//{
//
//}
#pragma mark --私有函数
-(void)_archiveListDataWithArray:(NSArray<NewsItem*> *)array{
     NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
     NSString *cachePath = [pathArray firstObject];
     
     NSFileManager *fileManager = [NSFileManager defaultManager];
     
     //创建文件夹
     NSString *dataPath = [cachePath stringByAppendingPathComponent:@"list"];
     NSError* createError;
     [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
     
     
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    //创建文件
    //序列化array，将它存储到整个文件中来
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
  //  NSLog(@"");
//    NSData* readListData = [fileManager contentsAtPath:listDataPath];
//
//    id unarchiveObj= [NSKeyedUnarchiver unarchivedObjectOfClass:[NSSet setWithObjects:[NSArray class],[NewsItem class],nil] fromData:readListData error:nil];
    
//    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
//    NSData *test = [[NSUserDefaults standardUserDefaults] stringForKey:@"listData"];
//    unarchiveObj= [NSKeyedUnarchiver unarchivedObjectOfClass:[NSSet setWithObjects:[NSArray class],[NewsItem class],nil] fromData:readListData error:nil];
//    NSLog(@"");
}

- (NSArray<NewsItem*> *) _readDataFromLocal{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"list/list"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    
//    id unarchiveObj= [NSKeyedUnarchiver unarchivedObjectOfClass:[NSSet setWithObjects:[NSArray class],[NewsItem class],nil] fromData:readListData error:nil];
    NSError *error;
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[NewsItem class],nil] fromData:readListData error:&error];

   // NSLog(@"");
    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count]>0){
        return (NSArray<NewsItem *> *)unarchiveObj;
    }
    return nil;
}
- (void)_getSandBoxPath{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"list"];
    NSError* createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    //创建文件
   NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    [fileManager createFileAtPath:listDataPath contents:nil attributes:nil];
    
    //查询文件
    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    //删除
    if(fileExist){
        [fileManager removeItemAtPath:listDataPath error:nil];
    }
    
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
    
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [fileHandler synchronizeFile];
    [fileHandler closeFile];
}
@end
