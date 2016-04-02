//
//  QPTabbar.h
//  PupaiTutorial
//
//  Created by baby on 16/4/2.
//  Copyright © 2016年 baby. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonClickCB)();

@interface QPTabbar : UITabBar

@property (nonatomic) ButtonClickCB cb;


@end
