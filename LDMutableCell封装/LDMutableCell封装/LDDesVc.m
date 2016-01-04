//
//  LDDesVc.m
//  LDMutableCell封装
//
//  Created by kingpoint on 15/12/30.
//  Copyright © 2015年 kingpoint. All rights reserved.
//

#import "LDDesVc.h"

@implementation LDDesVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self group1];
    [self group2];
    [self group3];
    [self group4];
    [self group5];
    [self group6];
}

//一、左边图片+大标题+小标题  右边 图片+箭头(图片和标题都是可选项)
-(void)group1{
    //1.左边图片、大标题、小标题  右边图片、箭头
    LDSettingItem * item = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightImage:@"image.jpg" cellType:LDSettingItemTypeImageAndArrow desVc:[LDDesVc class] Operation:^{
        //operation里面放点击后的操作
        //如果设置了desVc同时会跳转到目标控制器
        NSLog(@"我是谁？");
    }];
    //2.左边图片、大标题、小标题  右边箭头
    LDSettingItem * item1 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightImage:nil cellType:LDSettingItemTypeImageAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //3.左边图片、大标题  右边图片、箭头
    LDSettingItem * item2 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:nil rightImage:@"image.jpg" cellType:LDSettingItemTypeImageAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //4.大标题  右边图片、箭头
    LDSettingItem * item3 = [LDSettingItem itemWithLeftImage:nil leftMainTitle:@"牛不扭" leftDetailTitle:nil rightImage:@"image.jpg" cellType:LDSettingItemTypeImageAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //5.左边图片、大标题  右边箭头
    LDSettingItem * item4 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:nil rightImage:nil cellType:LDSettingItemTypeImageAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //创建装item的数组
    LDSettingGroup * group = [[LDSettingGroup alloc]init];
    group.header = @"左边图片、主副标题+右边图片、箭头";
    group.footer = @"就是这个范";
    group.items = @[item,item1,item2,item3,item4];
    //添加组到控制器的cell组里
    [self.allGroups addObject:group];
}

//二、左边图片、大标题、小标题  右边文字、箭头
-(void)group2{
    //1.左边图片、大标题、小标题  右边文字、箭头
    LDSettingItem * item = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightTitle:@"牛魔王" cellType:LDSettingItemTypeTitleAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //2.左边图片、大标题、小标题  右边箭头
    LDSettingItem * item1 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightTitle:nil cellType:LDSettingItemTypeTitleAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];;
    //3.左边图片、大标题  右边文字、箭头
    LDSettingItem * item2 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:nil rightTitle:@"牛魔王" cellType:LDSettingItemTypeTitleAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //4.大标题  右边文字、箭头
    LDSettingItem * item3 = [LDSettingItem itemWithLeftImage:nil leftMainTitle:@"牛不扭" leftDetailTitle:nil rightTitle:@"牛魔王" cellType:LDSettingItemTypeTitleAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //5.左边图片、大标题  右边箭头
    LDSettingItem * item4 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightTitle:nil cellType:LDSettingItemTypeTitleAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //创建装item的数组
    LDSettingGroup * group = [[LDSettingGroup alloc]init];
    group.header = @"左边图片、大标题、小标题  右边文字、箭头";
    group.footer = @"就是这个范";
    group.items = @[item,item1,item2,item3,item4];
    //添加组到控制器的cell组里
    [self.allGroups addObject:group];
}

//三、左边图片、大标题、小标题  右边纯文字
-(void)group3{
    //1.左边图片、大标题、小标题  右边纯文字
    LDSettingItem * item = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightTitle:@"牛魔王"cellType:LDSettingItemTypeOnlyTitle desVc:[LDDesVc class] Operation:^{
        
    }];
    //2.左边图片、大标题、小标题  右边无
    LDSettingItem * item1 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightTitle:nil cellType:LDSettingItemTypeOnlyTitle desVc:[LDDesVc class] Operation:^{
        
    }];
    //3.左边图片、大标题  右边纯文字
    LDSettingItem * item2 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:nil rightTitle:@"牛魔王"cellType:LDSettingItemTypeOnlyTitle desVc:[LDDesVc class] Operation:^{
        
    }];
    //4.左大标题  右边纯文字
    LDSettingItem * item3 = [LDSettingItem itemWithLeftImage:nil leftMainTitle:@"牛不扭" leftDetailTitle:nil rightTitle:@"牛魔王"cellType:LDSettingItemTypeOnlyTitle desVc:[LDDesVc class] Operation:^{
        
    }];
    //创建装item的数组
    LDSettingGroup * group = [[LDSettingGroup alloc]init];
    group.header = @"左边图片、大标题、小标题  右边纯文字";
    group.footer = @"就是这个范";
    group.items = @[item,item1,item2,item3];
    //添加组到控制器的cell组里
    [self.allGroups addObject:group];
}
//四、左边图片、大标题、小标题  右边textField
-(void)group4{
    
    //1.左边图片、大标题、小标题  右边textField
    LDSettingItem * item = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" placeholder:@"牛魔王" textFieldWidth:100 cellType:LDSettingItemTypeTextField Operation:^{
        
    }];
    //2.左边图片、大标题  右边textField
    LDSettingItem * item1 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:nil placeholder:@"牛魔王" textFieldWidth:150 cellType:LDSettingItemTypeTextField Operation:^{
        
    }];
    //3.左边大标题  右边textField
    LDSettingItem * item2 = [LDSettingItem itemWithLeftImage:nil leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" placeholder:@"牛魔王" textFieldWidth:200 cellType:LDSettingItemTypeTextField Operation:^{
        
    }];
    //创建装item的数组
    LDSettingGroup * group = [[LDSettingGroup alloc]init];
    group.header = @"左边图片、大标题、小标题  右边textField";
    group.footer = @"就是这个范";
    group.items = @[item,item1,item2];
    //添加组到控制器的cell组里
    [self.allGroups addObject:group];
}
//五、左边图片、大标题、小标题  右边switch
-(void)group5{
    
    //1.左边图片、大标题、小标题  右边switch
    LDSettingItem * item = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" cellType:LDSettingItemTypeSwitch valueKey:@"4" Operation:^{
        
    }];
    //2.左边图片、大标题  右边switch
    LDSettingItem * item1 = [LDSettingItem itemWithLeftImage:@"icon.jpg" leftMainTitle:@"牛不扭" leftDetailTitle:nil cellType:LDSettingItemTypeSwitch valueKey:@"5" Operation:^{
        
    }];
    //3.左边大标题  右边switch
    LDSettingItem * item2 = [LDSettingItem itemWithLeftImage:nil leftMainTitle:@"牛不扭" leftDetailTitle:nil cellType:LDSettingItemTypeSwitch valueKey:@"6" Operation:^{
        
    }];
    //创建装item的数组
    LDSettingGroup * group = [[LDSettingGroup alloc]init];
    group.header = @"左边图片、大标题、小标题  右边switch";
    group.footer = @"就是这个范";
    group.items = @[item,item1,item2];
    //添加组到控制器的cell组里
    [self.allGroups addObject:group];
}
//六、左边图片、大标题、小标题  右边badge、箭头
-(void)group6{
    //1.左边图片、大标题、小标题  右边badge<10、箭头
    LDSettingItem * item = [LDSettingItem itemWithLeftImage:@"icon.jpg"  leftMainTitle:@"牛不扭" leftDetailTitle:@"ld" rightBadgeNo:@"8" cellType:LDSettingItemTypeBadgeAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //2.左边图片、大标题  右边badge<100、箭头
    LDSettingItem * item1 = [LDSettingItem itemWithLeftImage:@"icon.jpg"  leftMainTitle:@"牛不扭" leftDetailTitle:nil rightBadgeNo:@"88" cellType:LDSettingItemTypeBadgeAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //3.左大标题  右边badge>100、箭头
    LDSettingItem * item2 = [LDSettingItem itemWithLeftImage:nil leftMainTitle:@"牛不扭" leftDetailTitle:nil rightBadgeNo:@"888" cellType:LDSettingItemTypeBadgeAndArrow desVc:[LDDesVc class] Operation:^{
        
    }];
    //创建装item的数组
    LDSettingGroup * group = [[LDSettingGroup alloc]init];
    group.header = @"左边图片、大标题、小标题  右边badge、箭头";
    group.footer = @"就是这个范";
    group.items = @[item,item1,item2];
    //添加组到控制器的cell组里
    [self.allGroups addObject:group];
}

@end
