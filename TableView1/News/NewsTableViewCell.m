//
//  NewsTableViewCell.m
//  TableView1
//
//  Created by bytedance on 2020/4/20.
//  Copyright © 2020 df. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsItem.h"
#import "GTScreen.h"

@interface NewsTableViewCell()




@end

@implementation NewsTableViewCell
@synthesize titleLabel;
@synthesize commentLabel;
@synthesize timeLabel;
@synthesize sourceLabel;
@synthesize deleteButton;
@synthesize imageView;
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.titleLabel = [[UILabel alloc] initWithFrame:UIRect(20, 15, 100, 50)];
        //self.titleLabel.backgroundColor = [UIColor redColor];
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.lineBreakMode = kCTLineBreakByTruncatingTail;
      
        [self.contentView addSubview:self.titleLabel];
      
        
        self.sourceLabel = [[UILabel alloc] initWithFrame:UIRect(20, 80, 60, 20)];
        //self.sourceLabel.backgroundColor = [UIColor redColor];
      
        [self.contentView addSubview:self.sourceLabel];
        
        
        self.commentLabel = [[UILabel alloc] initWithFrame:UIRect(100, 80, 60, 20)];
        //self.commentLabel.backgroundColor = [UIColor redColor];
      
        [self.contentView addSubview:self.commentLabel];
        
        
        self.timeLabel = [[UILabel alloc] initWithFrame:UIRect(180, 80, 60, 20)];
        //self.timeLabel.backgroundColor = [UIColor redColor];
      
        [self.contentView addSubview:self.timeLabel];
        
        [self.contentView addSubview:({
           // self.image = [[UIImage alloc] initWithContentsOfFile:[[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]]];
            //self.image = [[UIImage alloc]init];
            self.imageView = [[UIImageView alloc] initWithFrame:UIRect(300, 15, 100, 80)];
            //self.imageView.backgroundColor = [UIColor redColor];
            self.imageView;
            //[self.image ]
            //self.image.accessibilityFrame = CGRectMake(200, 15, 200, 150);
            //self.image;
            
        })];
    
        
        deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        //deleteButton.backgroundColor = [UIColor redColor];
        deleteButton.frame = UIRect(260, 80, 50, 20);
//        [self.deleteButton addTarget:self action:@selector(onClickDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
//        [self.contentView addSubview:self.deleteButton];
    }
    return self;
}
- (void)layoutTableViewCellWithItem:(NewsItem *)item{
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.text=item.title;
    
    self.sourceLabel.font = [UIFont systemFontOfSize:12];
    self.sourceLabel.text=item.author_name;
    
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.text=item.date;
    
    self.commentLabel.font = [UIFont systemFontOfSize:12];
    self.commentLabel.text=item.category;

    
    //开启downLoad线程加载图片数据（高耗时操作）
    //之后再用主线程进行渲染
    
    //dispatch_once dispatch_once 只运行一次，用于单例的创建
    //dispatch_source 事件源，自定义的触发和监听
    //dispatch_group 管理一组GCD Block
    //dispatch_semaphore 信号量，用于线程间同步
    //dispatch_barrier_async 并发队列中的同步点

    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
        dispatch_async(mainQueue, ^{
            self.imageView.image = image;
        });
    });
  
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
        
    // Configure the view for the selected state
}

- (void)onClickDeleteButton:(id)selector
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}


@end
