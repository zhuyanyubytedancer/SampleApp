//
//  VideoCoverViewCollectionViewCell.m
//  TableView1
//
//  Created by bytedance on 2020/4/23.
//  Copyright © 2020 df. All rights reserved.
//

#import "VideoCoverView.h"
#import <AVKit/AVKit.h>
#import "GTVideoPlayer.h"
#import "GTVideoToolbar.h"

@implementation VideoCoverView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height-GTVideoToolbarHeight)];
            _coverView.backgroundColor = [UIColor whiteColor];
            _coverView;
        })];
        [self addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2, (frame.size.height-GTVideoToolbarHeight -50)/2,50,50)];
            _playButton.image = [UIImage systemImageNamed:@"play"];
            //[_playButton addTarget:self action:@selector(_tapToPlay:) forControlEvents:UIControlEventTouchUpInside];
            _playButton;
        })];
        [self addSubview:({
            _toolbar = [[GTVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, _coverView.bounds.size.width, GTVideoToolbarHeight)];
        })];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay:)];
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}
//- (void)dealloc{
//    //记得在单例中移除自己
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

#pragma mark -- public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString*)videoUrl
{
    //暂时没有图片，先去掉
    //_coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoCoverUrl = videoCoverUrl;
    _videoUrl = videoUrl;
    [_toolbar layoutWithModel:nil];
    
}
- (void)layoutWithVideoUrl:(NSString*)videoUrl{
    _videoUrl = videoUrl;
}

#pragma mark - private method
//使用 AVPlayer 播放视频
//1.根据资源地址URL，创建AVPlayerIterm
//2、根据AVPlayerItem 创建播放器
//3.获取播放器中的Layer，粘贴到自己想要的位置
//4.播放以及基本的开始 & 暂停
-(void) _tapToPlay:(id)sender
{
    //NSLog(@"");
   // NSURL *videoUrl = [NSURL URLWithString:_videoUrl];
    [[GTVideoPlayer Player] playWithVideoUrl:_videoUrl attachView:_coverView];
    
}

@end
