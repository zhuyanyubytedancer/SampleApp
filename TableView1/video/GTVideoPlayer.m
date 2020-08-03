//
//  GTVideoPlayer.m
//  TableView1
//
//  Created by bytedance on 2020/4/23.
//  Copyright © 2020 df. All rights reserved.
//

#import "GTVideoPlayer.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@implementation GTVideoPlayer
//单例模式player
+ (GTVideoPlayer *)Player{
    static GTVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}
-(void)playWithVideoUrl:(NSString *)videoUrl attachView:(UIView *)attachView
{
    
       [self _stopPlay];
        NSURL *Url = [NSURL URLWithString:videoUrl];
       
       AVAsset *asset = [AVAsset assetWithURL:Url];
       _videoItem = [AVPlayerItem playerItemWithAsset:asset];
       [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
       [_videoItem addObserver:self forKeyPath:@"loadTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
       
       
       CMTime duration = _videoItem.duration;
       CGFloat videoDuration= CMTimeGetSeconds(duration);
       
       _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
       //监听播放进度
       [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
           NSLog(@"播放进度 %@",@(CMTimeGetSeconds(time)));
       }];
       //生成avlayer
       //从avplayer获取avplayerlayer
       _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
       _playerLayer.frame = attachView.bounds;
       //把视频播放粘贴到coverView上
       [attachView.layer addSublayer:_playerLayer];
     //  [avPlayer play];
       //NSLog(@"");
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
//
-(void) _stopPlay{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //移除player layer
    [_playerLayer removeFromSuperlayer];
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadTimeRanges"];
    _videoItem=nil;
    _avPlayer=nil; 
}
- (void) _handlePlayEnd:(id)sender
{
   // NSLog(@"");
 

    //重新播放
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
    
}

#pragma mark -- KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"status"]){
        if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
            [_avPlayer play];
        }else{
            NSLog(@"");
        }
    }
    else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSLog(@"缓冲 %@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
