//
//  LDSettingItem.m
//  01-LD
//
//  Created by apple on 15-12-23.
//  Copyright (c) 2015年 LD. All rights reserved.
//

#import "LDSettingItem.h"

@implementation LDSettingItem

/**
 *  （左边图片+主标题+副标题）（右边图片+箭头）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle rightImage:(NSString *)rightImageName cellType:(LDSettingItemType)type desVc:(Class)desVc Operation:(Operation)operation;{
    LDSettingItem * item = [LDSettingItem new];
    item.leftImage = leftImageName;
    item.leftMainTitle = leftMainTitle;
    item.leftDetailTitle = leftDetailTitle;
    item.rightImage = rightImageName;
    item.type = type;
    item.operation = operation;
    item.desVc = desVc;
    return item;
}
/**
 *  （左边图片+主标题+副标题）（右边文字+箭头）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle rightTitle:(NSString *)rightTitle cellType:(LDSettingItemType)type desVc:(Class)desVc Operation:(Operation)operation;{
    LDSettingItem * item = [LDSettingItem new];
    item.leftImage = leftImageName;
    item.leftMainTitle = leftMainTitle;
    item.leftDetailTitle = leftDetailTitle;
    item.rightTitle = rightTitle;
    item.type = type;
    item.operation = operation;
    item.desVc = desVc;
    return item;
}
/**
 *  （左边图片+主标题+副标题）（右边角标+箭头）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle rightBadgeNo:(NSString *)badgeNo cellType:(LDSettingItemType)type desVc:(Class)desVc Operation:(Operation)operation;{
    LDSettingItem * item = [LDSettingItem new];
    item.leftImage = leftImageName;
    item.leftMainTitle = leftMainTitle;
    item.leftDetailTitle = leftDetailTitle;
    item.badgeNo = badgeNo;
    item.type = type;
    item.operation = operation;
    item.desVc = desVc;
    return item;
}
/**
 *  （左边图片+主标题+副标题）（右边输入框）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle placeholder:(NSString *)placeholder textFieldWidth:(CGFloat)textWidth cellType:(LDSettingItemType)type Operation:(Operation)operation;{
    LDSettingItem * item = [LDSettingItem new];
    item.leftImage = leftImageName;
    item.leftMainTitle = leftMainTitle;
    item.leftDetailTitle = leftDetailTitle;
    item.placeHolder = placeholder;
    item.textWidth = textWidth;
    item.type = type;
    item.operation = operation;
    return item;
}
/**
 *  （左边图片+主标题+副标题）（右边switch）
 */
+(instancetype)itemWithLeftImage:(NSString *)leftImageName leftMainTitle:(NSString *)leftMainTitle leftDetailTitle:(NSString *)leftDetailTitle cellType:(LDSettingItemType)type valueKey:(NSString *)key Operation:(Operation)operation;{
    LDSettingItem * item = [LDSettingItem new];
    item.leftImage = leftImageName;
    item.leftMainTitle = leftMainTitle;
    item.leftDetailTitle = leftDetailTitle;
    item.type = type;
    item.valueKey = key;
    item.operation = operation;
    return item;
}
@end
