//
//  NewsItem.m
//  TableView1
//
//  Created by bytedance on 2020/4/22.
//  Copyright © 2020 df. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem
@synthesize category;
@synthesize picUrl;
@synthesize title;
@synthesize date;
@synthesize author_name;
@synthesize url;

#pragma mark --public method
//从字典条目中解析成news_item
- (void) configWithDictionary:(NSDictionary *) dictionary{
#warning 类型是否匹配
        self.category=[dictionary objectForKey:@"category"];
        self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
        self.title = [dictionary objectForKey:@"title"];
        self.date = [dictionary objectForKey:@"date"];
        self.author_name = [dictionary objectForKey:@"author_name"];
        self.url = [dictionary objectForKey:@"url"];
                     
    
}
#pragma --protocol
//实现了安全的协议
+ (BOOL)supportsSecureCoding{
    return YES;
}
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if(self){
        self.category=[coder decodeObjectForKey:@"category"];
        self.picUrl = [coder decodeObjectForKey:@"picUrl"];
        self.title=[coder decodeObjectForKey:@"title"];
        self.author_name = [coder decodeObjectForKey:@"author_name"];
        self.date=[coder decodeObjectForKey:@"date"];
        self.url = [coder decodeObjectForKey:@"url"];
        
        
    }
    return self;
}





- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.author_name forKey:@"author_name"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.url forKey:@"url"];
    
    
}
@end
