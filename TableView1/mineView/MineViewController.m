//
//  MainViewController.m
//  TableView1
//
//  Created by bytedance on 2020/4/24.
//  Copyright © 2020 df. All rights reserved.
//

#import "MineViewController.h"
#import <UIKit/UIKit.h>
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property (nonatomic,strong,readwrite) UITableView* tableView;
@property (nonatomic,strong,readwrite) UIImageView* headerImage;
@property (nonatomic,strong,readwrite) UIView* headerView;
@property (nonatomic,strong,readwrite) UITableView* tableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor =[UIColor whiteColor];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView;
       
    })];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
  
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"mineCellView"];
    if(!cell){
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineCellView"];
    }
    if(indexPath.row == 0){
        //cell.textLabel.text = @"地区";
        [cell.contentView addSubview:({
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 20)];
            label.text = @"昵称";
            label;
        })];
    }
    else{
        if(indexPath.row == 1){
               //cell.textLabel.text = @"地区";
               [cell.contentView addSubview:({
                   UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 20)];
                   label.text = @"地区";
                   label;
               })];
           }
    }
    
    return cell;
}
#pragma mark - Table view delegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(!_headerView){
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.height, 200)];
        _headerView.backgroundColor = [UIColor whiteColor];
        [_headerView addSubview:({
            _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-100)/2, 30, 100, 100)];
            //_headerImage.backgroundColor = [UIColor redColor];
            _headerImage.clipsToBounds = YES;
            _headerImage.contentMode = UIViewContentModeScaleAspectFit;
            _headerImage.userInteractionEnabled = YES;
            _headerImage.image = [UIImage systemImageNamed:@"pencil"];
            _headerImage;
        })];
    }
    return _headerView;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return _tableView.visibleSize.height-500;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
