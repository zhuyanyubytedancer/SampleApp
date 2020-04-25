//
//  NewsViewController.m
//  TableView1
//
//  Created by bytedance on 2020/4/20.
//  Copyright © 2020 df. All rights reserved.
//

#import "GTNewsViewController.h"
#import "NewsTableViewCell.h"
#import "WebViewController.h"
#import "GTMediator.h"
#import "DeleteCellView.h"
#import <WebKit/WebKit.h>
#import <AFNetworking.h>
#import "NewsLoader.h"
#import "NewsItem.h"
@interface GTNewsViewController ()<UITableViewDelegate,UITableViewDataSource,GTNewsTableViewCellDelegate>
@property (nonatomic,strong,readwrite) UITableView* tableView;
@property (nonatomic,strong,readwrite) NSMutableArray *cellArray;
@property (nonatomic,strong) NewsLoader* loader;
@property (nonatomic,strong) NSArray<NewsItem *> *dataArray;
@end

@implementation GTNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.tableView];
     self.loader = [[NewsLoader alloc] init];
    //解决block循环引用
    __weak typeof(self) wself = self;
    [self.loader loadListDataWithFinshBlock:^(BOOL success, NSArray<NewsItem *> *dataArray) {
        __strong typeof(self) strongSelf = wself;
        strongSelf.dataArray=dataArray;
        //注意，这里要reload一下
        [strongSelf.tableView reloadData];
       // NSLog(@"");
    }];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    //self.navigationItem.title = @"新闻";
    self.navigationItem.title=@"新闻";
//    self.cellArray = [[NSMutableArray alloc] initWithCapacity:20];
//    for(int i=0;i<20;++i){
//        [self.cellArray addObject:@"cell"];
//    }
   
    

    
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
       // [_cellArray addObject:cell];
         cell.delegate = self;
    }
    [cell layoutTableViewCellWithItem:_dataArray[indexPath.row]];
    //cell.titleLabel.text = [NSString stringWithFormat:@"ios开发教程-%@",@(indexPath.row)];
   
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* urlString = self.dataArray[indexPath.row].url;
    // NewsItem *item = self.dataArray[indexPath.row];
     //  [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniqueKey];
    //run-target方式
    __kindof UIViewController *viewController = [GTMediator detailViewControllerWithUrl:urlString];
    viewController.title = @"新闻";
    [self.navigationController pushViewController:viewController animated:TRUE];
//    //处理response
   //   [GTMediator openUrl:@"detail//" params:@{@"url":urlString,@"controller":self}];
//    Class cls = [GTMediator classForProtocol:@protocol(WebViewControllerProtocol)];
//    [self.navigationController pushViewController:[[[cls class] alloc] initWithUrlString:urlString] animated:YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableViewCell:(nonnull UITableViewCell *)tableViewCell clickDeleteButton:(nonnull UIButton *)deleteButton {
    //[tableViewCell showDelete]
    NSLog(@"click deleteButton");
    DeleteCellView *deleteCellView=[[DeleteCellView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    //block需要处理循环引用的问题
    __weak typeof(self) wSelf = self;
    
    [deleteCellView showDeleteViewFromPoint:rect.origin clickBlock:^{
        NSLog(@"delete cell");
       __strong typeof(self) strongSelf = wSelf;
        [self.cellArray removeObjectAtIndex:[strongSelf.tableView indexPathForCell:tableViewCell].row];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    }];
    
}


@end
