//
//  NewsTableViewCell.h
//  TableView1
//
//  Created by bytedance on 2020/4/20.
//  Copyright © 2020 df. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsItem;
NS_ASSUME_NONNULL_BEGIN
@protocol GTNewsTableViewCellDelegate <NSObject>

-(void) tableViewCell:(UITableViewCell*)tableViewCell clickDeleteButton:(UIButton*) deleteButton;

@end

@interface NewsTableViewCell : UITableViewCell
{
    UILabel* titleLabel;
    UILabel* sourceLabel;
    UILabel* commentLabel;
    UILabel* timeLabel;
    UIButton* deleteButton;
    UIImageView* imageView;

}
@property (strong,nonatomic) UILabel* titleLabel;
@property (strong,nonatomic) UILabel* sourceLabel;
@property (strong,nonatomic) UILabel* commentLabel;
@property (strong,nonatomic) UILabel* timeLabel;
@property (strong,nonatomic) UIButton* deleteButton;
@property (strong,nonatomic) UIImageView* imageView;
@property (nonatomic,weak,readwrite) id<GTNewsTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(NewsItem *)item;
@end

NS_ASSUME_NONNULL_END
