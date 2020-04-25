//
//  VideoCoverViewCollectionViewCell.h
//  TableView1
//
//  Created by bytedance on 2020/4/23.
//  Copyright © 2020 df. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GTVideoToolbar;
@interface VideoCoverView : UICollectionViewCell

@property (nonatomic,strong,readwrite) UIImageView *coverView;
@property (nonatomic,strong,readwrite) UIImageView *playButton;
@property (nonatomic,strong) NSString *videoCoverUrl;
@property (nonatomic,strong) NSString *videoUrl;
@property (nonatomic,strong,readwrite) GTVideoToolbar* toolbar;

//@property (nonatomic,strong,readwrite) AVPlayerItem *videoItem;
//@property (nonatomic,strong,readwrite) AVPlayer *avPlayer;
//@property (nonatomic,strong,readwrite) AVPlayerLayer *playerLayer;
  //生成avlayer
  //从avplayer获取avplayerlayer
  
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString*)videoUrl;
@end



NS_ASSUME_NONNULL_END
