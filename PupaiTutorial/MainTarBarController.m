//
//  MainTarBarController.m
//  PupaiTutorial
//
//  Created by baby on 16/4/2.
//  Copyright © 2016年 baby. All rights reserved.
//

#import "MainTarBarController.h"

@interface MainTarBarController ()


@end

@implementation MainTarBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    QPTabbar* qPTabbar = [[QPTabbar alloc]init];
//    
//    [self setValue:qPTabbar forKeyPath:@"tabBar"];
    _qPTabbar.cb = ^(){
        NSLog(@"click");
    };

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
