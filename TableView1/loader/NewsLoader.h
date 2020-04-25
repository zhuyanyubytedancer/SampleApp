//
//  NewsLoader.h
//  TableView1
//
//  Created by bytedance on 2020/4/22.
//  Copyright © 2020 df. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewsItem;
typedef void(^NewsLoaderFinishBlock)(BOOL success,NSArray<NewsItem*> *dataArray);

NS_ASSUME_NONNULL_BEGIN

@interface NewsLoader : NSObject

- (void)loadListDataWithFinshBlock:(NewsLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
