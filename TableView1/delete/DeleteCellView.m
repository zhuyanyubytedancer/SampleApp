//
//  DeleteCellView.m
//  TableView1
//
//  Created by bytedance on 2020/4/21.
//  Copyright © 2020 df. All rights reserved.
//

#import "DeleteCellView.h"

@interface DeleteCellView ()

@property(nonatomic,strong,readwrite) UIView* backgroundView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;
@property(nonatomic,strong,readwrite) dispatch_block_t deleteBlock;

@end
@implementation DeleteCellView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            [_backgroundView addGestureRecognizer:({
                UIGestureRecognizer *gr = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView:)];
                gr;
            })];
            _backgroundView;
        })];
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,0,0)];
            _deleteButton.backgroundColor = [UIColor blueColor];
            [_deleteButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton;
        })];
    }
    return self;
}

- (void) showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t)clickBlock
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.frame.size.width-200)/2,(self.frame.size.height-200)/2,200,200);
//    }];
//       UIViewAnimationOptionCurveEaseInOut            = 0 << 16, // default
//       UIViewAnimationOptionCurveEaseIn               = 1 << 16,
//       UIViewAnimationOptionCurveEaseOut              = 2 << 16,
//       UIViewAnimationOptionCurveLinear               = 3 << 16,
    self.deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    self.deleteBlock = [clickBlock copy];
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations: ^{
         self.deleteButton.frame = CGRectMake((self.frame.size.width-200)/2,(self.frame.size.height-200)/2,200,200);
            }
            completion:^(BOOL finished){
        //NSLog(@"animation completed.");
    }];
}

- (void)dismissDeleteView:(id)sender{
    [self removeFromSuperview];
}
- (void)clickButton:(id)sender
{
//    [self dismissDeleteView];
    if(_deleteBlock){
        _deleteBlock();
       // NSLog(@"delete cell");
    }
    [self removeFromSuperview];
}


@end
