//
//  LDSettingItem.h
//  01-LD
//
//  Created by apple on 15-12-23.
//  Copyright (c) 2015年 LD. All rights reserved.
//  一个Item对应一个Cell
// 用来描述当前cell里面显示的内容，描述点击cell后做什么事情

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef enum {
    LDSettingItemTypeImageAndArrow = 0, // 右边图片加箭头
    LDSettingItemTypeTitleAndArrow, // 右边文字加箭头
    LDSettingItemTypeOnlyTitle, // 右边文字
    
    LDSettingItemTypeBadgeAndArrow,//右边角标加箭头
    LDSettingItemTypeTextField, // 右边输入框
    LDSettingItemTypeSwitch // 右边开关
   
}LDSettingItemType;

typedef void(^Operation)();
@interface LDSettingItem : NSObject
/**
 cell左边的图片
 */
@property (nonatomic, copy) NSString * leftImage;
/**
 cell左边的mainTitle
 */
@property (nonatomic, copy) NSString * leftMainTitle;
/**
 cell左边的detailTitle
 */
@property (nonatomic, copy) NSString * leftDetailTitle;
/**
 cell右边的图片
 */
@property (nonatomic, weak) NSString * rightImage;
/**
 cell右边的badge
 */
@property (nonatomic, weak) NSString * badgeNo;
/** 
 cell右边的标题
 */
@property (nonatomic, copy) NSString * rightTitle;
/** 
 cell右边的占为文字 
 */
@property (nonatomic, copy) NSString *placeHolder;
/**
 cell TextField的宽度
 */
@property (nonatomic, assign) CGFloat textWidth;
/**
 cell 用于存取switch的key，注意每个item的key要不同
 */
@property (nonatomic, copy) NSString * valueKey;
/** 
 cell类型
 */
@property (nonatomic, assign) LDSettingItemType type;
/**
 cell跳转的目标控制器
 */
@property (nonatomic, strong) Class desVc;
/** 
 点击Cell的操作 
 */
@property (nonatomic, copy) Operation operation;
/**
 *  （左边图片+主标题+副标题）（右边图片+箭头）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle rightImage:(NSString *)rightImageName cellType:(LDSettingItemType)type desVc:(Class)desVc Operation:(Operation)operation;
/**
 *  （左边图片+主标题+副标题）（右边文字+箭头）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle rightTitle:(NSString *)rightTitle cellType:(LDSettingItemType)type desVc:(Class)desVc Operation:(Operation)operation;
/**
 *  （左边图片+主标题+副标题）（右边角标+箭头）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle rightBadgeNo:(NSString *)badgeNo cellType:(LDSettingItemType)type desVc:(Class)desVc Operation:(Operation)operation;
/**
 *  （左边图片+主标题+副标题）（右边输入框）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle placeholder:(NSString *)placeholder textFieldWidth:(CGFloat)textWidth cellType:(LDSettingItemType)type Operation:(Operation)operation;

/**
 *  （左边图片+主标题+副标题）（右边switch）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle cellType:(LDSettingItemType)type valueKey:(NSString *)key Operation:(Operation)operation;

@end
