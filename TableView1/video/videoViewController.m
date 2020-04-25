//
//  videoViewController.m
//  TableView1
//
//  Created by bytedance on 2020/4/19.
//  Copyright © 2020 df. All rights reserved.
//

#import "videoViewController.h"
#import "VideoCoverView.h"

@interface videoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation videoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing=10;
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.width/16*9);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    [collectionView registerClass:[VideoCoverView class] forCellWithReuseIdentifier:@"VideoCoverView"];
    
    //if([ ])
    //为了适配iphone8...可能会设为never，自己进行适配
    //collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    collectionView.delegate=self;
    collectionView.dataSource=self;
    [self.view addSubview:collectionView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
    
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCoverView" forIndexPath:indexPath];
   // cell.backgroundColor=[UIColor redColor];
   // cell.intrinsicContentSize = CGSizeMake((self.view.frame.size-10)/2,300);
    if([cell isKindOfClass:[VideoCoverView class]]){
        [(VideoCoverView* )cell layoutWithVideoCoverUrl:@"http://sandbox.thewikies.com/vfe-generator/images/big-buck-bunny_poster.jpg" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   // if(indexPath.item%3==0){
      //  return CGSizeMake(self.view.frame.size.width,300);
   // }
    //else
    return CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.width/16*9);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
