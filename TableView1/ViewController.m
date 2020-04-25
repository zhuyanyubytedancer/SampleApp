//
//  ViewController.m
//  TableView1
//
//  Created by bytedance on 2020/4/19.
//  Copyright © 2020 df. All rights reserved.
//

// 只负责展示，协助管理，不管理数据
#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    UITableView *tableView = [[UITableView alloc] initWithFrame:screen];
    tableView.dataSource=self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
}
//#pragma -mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    //NSInteger row = [NSNumber numberWithInt:10];
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.textLabel.text = @"主标题";
    cell.detailTextLabel.text = @"副标题";
    //cell.imageView = [UIImage imageNamed:@""];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = [NSString stringWithFormat:@"Content at %@",@(indexPath.row)];
    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = 360;
    CGFloat labelHeight = 20;
    CGFloat labelTopView = 80;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width-labelWidth)/2, labelTopView, labelWidth, labelHeight)];
    label.text = [NSString stringWithFormat: @"This a content page of %@th subject.",@(indexPath.row)];
    viewController.view.backgroundColor=[UIColor whiteColor];
    [viewController.view addSubview:label];
    [self.navigationController pushViewController:viewController animated:TRUE];
    
}
@end
