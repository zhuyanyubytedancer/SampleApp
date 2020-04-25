//
//  NewsItem.h
//  TableView1
//
//  Created by bytedance on 2020/4/22.
//  Copyright © 2020 df. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsItem : NSObject <NSCoding,NSSecureCoding>
{
    NSString* category;
    NSString* picUrl;
    NSString* title;
    NSString* date;
    NSString* author_name;
    NSString *url;
}

@property (nonatomic,strong,readwrite) NSString* category;
@property (nonatomic,strong,readwrite) NSString* picUrl;
@property (nonatomic,strong,readwrite) NSString* title;
@property (nonatomic,strong,readwrite) NSString* date;
@property (nonatomic,strong,readwrite) NSString* author_name;
@property (nonatomic,strong,readwrite) NSString *url;

//对字典进行解析

- (void) configWithDictionary:(NSDictionary *) dictionary;
- (nullable instancetype)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;
+ (BOOL)supportsSecureCoding;
@end

NS_ASSUME_NONNULL_END
