//
//  TeamViewController.m
//  TableView1
//
//  Created by bytedance on 2020/4/20.
//  Copyright © 2020 df. All rights reserved.
//

#import "TeamViewController.h"

@interface TeamViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSDictionary *dictData;
//@property (strong,nonatomic) NSArray *tempList;
@property (strong,nonatomic) NSArray *listGroupname;
@end

@implementation TeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team_dictionary" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *tempList = [self.dictData allKeys];
    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *groupName = self.listGroupname[section];
    NSArray *listTeams = self.dictData[groupName];
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *groupName = self.listGroupname[section];
    NSArray *listTeams = self.dictData[groupName];
    cell.textLabel.text=listTeams[row];
    return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.listGroupname count];
}
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *groupName = self.listGroupname[section];
    return groupName;
    
}
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for(NSString *item in self.listGroupname){
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
    }
    return listTitles;
}
//- (NSArray *) sectionIndexTitleForTable
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
