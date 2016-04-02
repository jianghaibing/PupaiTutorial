//
//  QPTabbar.m
//  PupaiTutorial
//
//  Created by baby on 16/4/2.
//  Copyright © 2016年 baby. All rights reserved.
//

#import "QPTabbar.h"

@implementation QPTabbar

- (void) layoutSubviews{
    [super layoutSubviews];
    [self createRecordButton];
    
    int i = 0;
    CGFloat itemWith = [[UIScreen mainScreen] bounds].size.width / ((CGFloat) self.items.count + 1);
    for (UIView *tabbarButton in self.subviews) {
        if ([tabbarButton isKindOfClass:(NSClassFromString(@"UITabBarButton"))]) {
            if (i == 1){
                i = 2;
            }
            tabbarButton.frame = CGRectMake(itemWith * i, 1, itemWith, self.bounds.size.height);
            i++;
        }
    }
}

- (void) createRecordButton{
    UIButton *recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [recordBtn setTitle:@"录制" forState:UIControlStateNormal];
    [recordBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [recordBtn setImage:@"" forState:UIControlStateNormal];
//    [recordBtn setImage:@"" forState:UIControlStateHighlighted];
    [recordBtn sizeToFit];
    recordBtn.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [recordBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:recordBtn];
}

- (void) buttonClick{
    _cb();
}

@end
