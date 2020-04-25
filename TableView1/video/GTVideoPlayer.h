//
//  GTVideoPlayer.h
//  TableView1
//
//  Created by bytedance on 2020/4/23.
//  Copyright © 2020 df. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject
@property (nonatomic,strong,readwrite) AVPlayerItem *videoItem;
@property (nonatomic,strong,readwrite) AVPlayer *avPlayer;
@property (nonatomic,strong,readwrite) AVPlayerLayer *playerLayer;
+ (GTVideoPlayer *)Player;
-(void)playWithVideoUrl:(NSString *)videoUrl attachView:(UIView *)attachView;
@end

NS_ASSUME_NONNULL_END
