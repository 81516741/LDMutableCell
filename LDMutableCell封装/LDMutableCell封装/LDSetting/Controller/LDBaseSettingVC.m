//
//  LDBaseSettingVC.m
//  Setting封装
//
//  Created by mac on 15/12/29.
//  Copyright © 2015年 LD. All rights reserved.
//
#import "LDBaseSettingVC.h"
#import "LDSettingCell.h"
@implementation LDBaseSettingVC

#pragma mark - 初始化就设置成group模式
-(instancetype)init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}
#pragma  mark - 懒加载
-(NSMutableArray *)allGroups{
    if (_allGroups == nil) {
        _allGroups = [[NSMutableArray alloc]init];
    }
    return _allGroups;
}
#pragma mark - TableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    LDSettingGroup *group = _allGroups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LDSettingCell *cell = [LDSettingCell settingCellWithTableView:tableView];
    LDSettingGroup *group = _allGroups[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出这行对应的模型
    LDSettingGroup *group = _allGroups[indexPath.section];
    LDSettingItem *item = group.items[indexPath.row];
    
    // 取出这行对应模型中的block代码
    if (item.operation) {
        item.operation();
    }
    //跳转到目标控制器
    if (item.desVc) {
        UITableViewController * vc = [[item.desVc alloc]init];
        vc.title = item.leftMainTitle;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//分别设置header 和 footer 各自的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LDSettingGroup *group = _allGroups[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    LDSettingGroup *group = _allGroups[section];
    return group.footer;
}

@end
