//
//  GTVideoToolbar.h
//  TableView1
//
//  Created by bytedance on 2020/4/23.
//  Copyright © 2020 df. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define GTVideoToolbarHeight 60
@interface GTVideoToolbar : UIView
@property(nonatomic,strong,readwrite) UIImageView *avatorImageView;
@property(nonatomic,strong,readwrite) UILabel* nickLabel;
@property(nonatomic,strong,readwrite) UIImageView* commentImageView;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;
@property(nonatomic,strong,readwrite) UIImageView *likeImageView;
@property(nonatomic,strong,readwrite) UILabel *likeLabel;
@property(nonatomic,strong,readwrite) UIImageView* shareImageView;
@property(nonatomic,strong,readwrite) UILabel *shareLabel;
-(void)layoutWithModel:(NSObject *)model;
@end

NS_ASSUME_NONNULL_END
