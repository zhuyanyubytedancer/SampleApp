//
//  DeleteCellView.h
//  TableView1
//
//  Created by bytedance on 2020/4/21.
//  Copyright © 2020 df. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteCellView: UIView
{
    
}
- (void) showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
