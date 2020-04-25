//
//  GTVideoToolbar.m
//  TableView1
//
//  Created by bytedance on 2020/4/23.
//  Copyright © 2020 df. All rights reserved.
//

#import "GTVideoToolbar.h"

@implementation GTVideoToolbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:({
            _avatorImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _avatorImageView.layer.masksToBounds = YES;
            _avatorImageView.layer.cornerRadius = 15;
            _avatorImageView.translatesAutoresizingMaskIntoConstraints = NO;
            _avatorImageView;
        })];
        [self addSubview:({
            _nickLabel = [[UILabel alloc] init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints=NO;
            _nickLabel;
        })];
        [self addSubview:({
                _commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
                _commentImageView.layer.masksToBounds = YES;
                _commentImageView.layer.cornerRadius = 15;
                _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
                _commentImageView;
            })];
       [self addSubview:({
                _commentLabel = [[UILabel alloc] init];
                _commentLabel.font = [UIFont systemFontOfSize:15];
                _commentLabel.textColor = [UIColor lightGrayColor];
                _commentLabel.translatesAutoresizingMaskIntoConstraints=NO;
                _commentLabel;
            })];
        [self addSubview:({
                _likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
                _likeImageView.layer.masksToBounds = YES;
                _likeImageView.layer.cornerRadius = 15;
                _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
                _likeImageView;
            })];
       [self addSubview:({
                _likeLabel = [[UILabel alloc] init];
                _likeLabel.font = [UIFont systemFontOfSize:15];
                _likeLabel.textColor = [UIColor lightGrayColor];
                _likeLabel.translatesAutoresizingMaskIntoConstraints=NO;
                _likeLabel;
            })];
        [self addSubview:({
                _shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
                _shareImageView.layer.masksToBounds = YES;
                _shareImageView.layer.cornerRadius = 15;
                _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
                _shareImageView;
            })];
        [self addSubview:({
                _shareLabel = [[UILabel alloc] init];
                _shareLabel.font = [UIFont systemFontOfSize:15];
                _shareLabel.textColor = [UIColor lightGrayColor];
                _shareLabel.translatesAutoresizingMaskIntoConstraints=NO;
                _shareLabel;
        })];
    }
    return  self ;
}

//autolayout
-(void)layoutWithModel:(NSObject *)model
{
    self.backgroundColor = [UIColor whiteColor];
    _avatorImageView.image = [UIImage systemImageNamed:@"pencil"];
    _nickLabel.text = @"即可时间";
    
    _commentImageView.image = [UIImage systemImageNamed:@"pencil"];
    _commentLabel.text = @"100";
    
    _likeImageView.image = [UIImage systemImageNamed:@"pencil"];
    _likeLabel.text =@"25";
    
    _shareImageView.image = [UIImage systemImageNamed:@"pencil"];
    _shareLabel.text=@"分享";
    
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self  attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
         [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:15],
         [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:30],
         [NSLayoutConstraint constraintWithItem:_avatorImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:30],
         [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_avatorImageView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
          [NSLayoutConstraint constraintWithItem:_nickLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_avatorImageView attribute:NSLayoutAttributeLeft multiplier:1 constant:15],

    ]];
//    NSString *vflString = @"H:|-15-[_avatorImageView]-0-[_nickLabel]->=0-[_commentImageView==(_avatorImageView)]-0-[_commentLabel]-15-[_likeImageView==(_avatorImageView)]-0-[_likeLabel]-15-[_shareImageView==(_avatorImageView)]-0-[_shareLabel]-15-|";
    NSString *vflString = @"H:|-15-[_avatorImageView]-0-[_nickLabel]->=0-[_commentImageView]-0-[_commentLabel]-15-[_likeImageView]-0-[_likeLabel]-15-[_shareImageView]-0-[_shareLabel]-15-|";
//    NSString *vflString =@"|-[_avatorImageView]-[_nickLabel]-[_commentImageView]-[_commentLabel]-[_likeImageView]-[_likeLabel]-[_shareImageView]-[_shareLabel]-|";
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat: vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatorImageView,_nickLabel,_commentImageView,_commentLabel,_likeImageView,_likeLabel,_shareImageView,_shareImageView,_shareLabel)]];
//        [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat: vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatorImageView,_nickLabel,_commentImageView,_commentLabel)]];
}

@end
