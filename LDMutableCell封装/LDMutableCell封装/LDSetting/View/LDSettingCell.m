//
//  LDSettingCell.m
//  01-LD
//
//  Created by apple on 15-12-23.
//  Copyright (c) 2015年 LD. All rights reserved.
//

#import "LDSettingCell.h"
#import "LDSettingItem.h"
#import "Masonry.h"
@interface LDSettingCell()<UITextFieldDelegate>
/**
 右边图片
 */
@property(nonatomic, weak) UIImageView  * rightImageView;
/**
 右边文字
 */
@property(nonatomic, weak) UILabel  * rightTitle;
/**
 右边只有文字
 */
@property(nonatomic, weak) UILabel  * rightOnlyTitle;
/**
 右边textField
 */
@property(nonatomic, weak) UITextField  * textField;
/**
 右边开关按钮
 */
@property(nonatomic, weak) UISwitch  * switchView;

@end

@implementation LDSettingCell

#pragma mark - 懒加载
-(UIImageView *)rightImageView{
    if (_rightImageView == nil) {
        UIImageView * imageView = [[UIImageView alloc]init];
        _rightImageView = imageView;
        [self addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-44);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
    }
    return _rightImageView;
}

-(UILabel *)rightTitle{
    if (_rightTitle == nil) {
        UILabel * lable = [[UILabel alloc]init];
        _rightTitle = lable;
        [self addSubview:_rightTitle];
        [_rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-44);
            make.centerY.equalTo(self);
        }];
    }
    return _rightTitle;
}

-(UILabel *)rightOnlyTitle{
    if (_rightOnlyTitle == nil) {
        UILabel * lable = [[UILabel alloc]init];
        _rightOnlyTitle = lable;
        [self addSubview:_rightOnlyTitle];
        [_rightOnlyTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-20);
            make.centerY.equalTo(self);
        }];
    }
    return _rightOnlyTitle;
}

-(UITextField *)textField{
    if (_textField == nil) {
        UITextField * textField = [[UITextField alloc]init];
        _textField = textField;
        [self addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-20);
            make.centerY.equalTo(self);
            make.height.equalTo(@30);
            make.width.equalTo(@250);
        }];
    }
    return _textField;
}

-(UISwitch *)switchView{
    if (_switchView == nil) {
        UISwitch * switchView = [[UISwitch alloc]init];
        _switchView = switchView;
        [self addSubview:switchView];
        [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-20);
            make.centerY.equalTo(self);
        }];
        [switchView addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}


#pragma mark - 初始化设置
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //添加分割线
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.width.equalTo(self);
        make.height.equalTo(@1);
    }];
    //取消选中样式
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return self;
}

+ (id)settingCellWithTableView:(UITableView *)tableView
{
    // cell重用
    static NSString *ID = @"Cell";
    LDSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LDSettingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}
#pragma mark - cell的设置
- (void)setItem:(LDSettingItem *)item
{
    _item = item;
    //重置数据，防止重用带来的困扰
    self.imageView.image = nil;
    self.textLabel.text = nil;
    self.detailTextLabel.text = nil;
    self.accessoryType = UITableViewCellAccessoryNone;
    _rightImageView.image = nil;
    _rightTitle.text = nil;
    _rightOnlyTitle.text = nil;
    _textField.hidden = YES;
    _switchView.hidden = YES;
    // 根据类型设置cell
    if (item.type == LDSettingItemTypeImageAndArrow) {
        self.imageView.image = [UIImage imageNamed:item.leftImage];
        self.textLabel.text = item.leftMainTitle;
        self.detailTextLabel.text = item.leftDetailTitle;
        self.rightImageView.image = [UIImage imageNamed:item.rightImage];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (item.type == LDSettingItemTypeTitleAndArrow) {
        self.imageView.image = [UIImage imageNamed:item.leftImage];
        self.textLabel.text = item.leftMainTitle;
        self.detailTextLabel.text = item.leftDetailTitle;
        self.rightTitle.text = item.rightTitle;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (item.type == LDSettingItemTypeOnlyTitle) {
        self.imageView.image = [UIImage imageNamed:item.leftImage];
        self.textLabel.text = item.leftMainTitle;
        self.detailTextLabel.text = item.leftDetailTitle;
        self.rightOnlyTitle.text = item.rightTitle;
    }else if (item.type == LDSettingItemTypeTextField){
        self.imageView.image = [UIImage imageNamed:item.leftImage];
        self.textLabel.text = item.leftMainTitle;
        self.detailTextLabel.text = item.leftDetailTitle;
        self.textField.hidden = NO;
        self.textField.placeholder = item.placeHolder;
        if (item.textWidth > 0) {
            [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(item.textWidth));
            }];
        }
    }else if (item.type == LDSettingItemTypeSwitch){
        self.imageView.image = [UIImage imageNamed:item.leftImage];
        self.textLabel.text = item.leftMainTitle;
        self.detailTextLabel.text = item.leftDetailTitle;
        self.switchView.hidden = NO;
        self.switchView.on = [[[NSUserDefaults standardUserDefaults]valueForKey:_item.valueKey] integerValue];
    }else if (item.type == LDSettingItemTypeBadgeAndArrow){
        self.imageView.image = [UIImage imageNamed:item.leftImage];
        self.textLabel.text = item.leftMainTitle;
        self.detailTextLabel.text = item.leftDetailTitle;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    [self setNeedsDisplay];

}

//画badge提示红点和数字
-(void)drawRect:(CGRect)rect{
    if (!_item.badgeNo) return;
    if (_item.badgeNo.intValue < 10 && _item.badgeNo.intValue > 0 ) {
        UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.size.width - 60,rect.size.height * 0.5 -9 , 18, 18)];
        [[UIColor redColor]setFill];
        [path fill];
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
        dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [_item.badgeNo drawAtPoint:CGPointMake(rect.size.width - 60 + 4.5, rect.size.height * 0.5 - 9) withAttributes:dic];
    }else if (_item.badgeNo.intValue > 10 && _item.badgeNo.intValue < 100){
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(rect.size.width - 65, rect.size.height * 0.5 -9, 28, 18) cornerRadius:9];
        [[UIColor redColor]setFill];
        [path fill];
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
        dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [_item.badgeNo drawAtPoint:CGPointMake(rect.size.width - 60 , rect.size.height * 0.5 - 9) withAttributes:dic];
        
    }else{
        UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(rect.size.width - 65, rect.size.height * 0.5 -9, 28, 18) cornerRadius:9];
        [[UIColor redColor]setFill];
        [path fill];
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        dic[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [@"99+" drawAtPoint:CGPointMake(rect.size.width - 60 -3 , rect.size.height * 0.5 - 9) withAttributes:dic];
    }
    
    
}
//监听switch的value变化，并存到沙盒
-(void)valueChange{
    [[NSUserDefaults standardUserDefaults]setObject:@(self.switchView.on) forKey:_item.valueKey];
}
@end
