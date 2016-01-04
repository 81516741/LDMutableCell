//
//  LDSettingCell.h
//  01-LD
//
//  Created by apple on 15-12-23.
//  Copyright (c) 2015年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LDSettingItem;
@interface LDSettingCell : UITableViewCell
@property (nonatomic, strong) LDSettingItem *item;
+ (id)settingCellWithTableView:(UITableView *)tableView;
@end
