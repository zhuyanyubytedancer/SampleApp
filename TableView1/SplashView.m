//
//  SplashView.m
//  TableView1
//
//  Created by bytedance on 2020/4/24.
//  Copyright © 2020 df. All rights reserved.
//

#import "SplashView.h"

@implementation SplashView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:({
            _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-200)/2, (self.frame.size.height-200)/2, 200, 200)];
            _imageView.image = [UIImage systemImageNamed:@"pencil"];
            _imageView;
        })];

        [self addSubview:({
            _skipButton = [[UIButton alloc] initWithFrame:CGRectMake(300, 100, 50, 20)];
//            _skipButton.titleLabel.text = @"跳过";
//            _skipButton.titleLabel.textColor = [UIColor blackColor];
//            [_skipButton addSubview:_skipButton.titleLabel];
            [_skipButton setTitle:@"跳过" forState:UIControlStateNormal];
            _skipButton.backgroundColor = [UIColor lightGrayColor];
            [_skipButton addTarget:self action:@selector(_onClick:) forControlEvents:UIControlEventTouchUpInside];
            _skipButton;
        })];
        //允许用户交互
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)_onClick:(id)sender
{
    [self removeFromSuperview];
}

@end
