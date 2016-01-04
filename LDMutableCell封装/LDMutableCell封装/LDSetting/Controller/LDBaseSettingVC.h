//
//  LDBaseSettingVC.h
//  Setting封装
//
//  Created by mac on 15/12/29.
//  Copyright © 2015年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDSettingGroup.h"
#import "LDSettingItem.h"
@interface LDBaseSettingVC : UITableViewController
/**
 控制器的所有cell组的集合
 */
@property(nonatomic, strong) NSMutableArray  * allGroups;
@end
