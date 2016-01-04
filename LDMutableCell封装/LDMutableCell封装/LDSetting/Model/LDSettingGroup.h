//
//  LDSettingGroup.h
//  01-LD
//
//  Created by apple on 15-12-23.
//  Copyright (c) 2015年 LD. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface LDSettingGroup : NSObject
/**
 每个section的header标题
 */
@property (nonatomic, copy) NSString *header;
/**
 每个section的footer标题
 */
@property (nonatomic, copy) NSString *footer;
/**
 每个section的cell数组
 */
@property (nonatomic, strong) NSArray *items;

@end
