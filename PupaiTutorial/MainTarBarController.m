//
//  MainTarBarController.m
//  PupaiTutorial
//
//  Created by baby on 16/4/2.
//  Copyright © 2016年 baby. All rights reserved.
//

#import "MainTarBarController.h"
#import <ALBBQuPaiPlugin/ALBBQuPaiPlugin.h>


@interface MainTarBarController ()

@property (nonatomic) QupaiSDK *sdk;

@end

@implementation MainTarBarController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sdk = [QupaiSDK shared];
    [_sdk setDelegte:(id<QupaiSDKDelegate>)self];

    _qPTabbar.cb = ^(){
        CGSize videoSize = CGSizeMake(640, 1136);
        UIViewController *recordController = [_sdk createRecordViewControllerWithMinDuration:2 maxDuration:8 bitRate:2000000 videoSize:videoSize];
        [self presentViewController:recordController animated:YES completion:nil];
    };

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - QupaiSDK Delegate

- (void)qupaiSDKCancel:(QupaiSDK *)sdk{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)qupaiSDK:(QupaiSDK *)sdk compeleteVideoPath:(NSString *)videoPath thumbnailPath:(NSString *)thumbnailPath
{
    
    /*保存到本地相册
    [self dismissViewControllerAnimated:YES completion:nil];
    if (videoPath) {
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, nil, nil, nil);
    }
    if (thumbnailPath) {
        UIImageWriteToSavedPhotosAlbum([UIImage imageWithContentsOfFile:thumbnailPath], nil, nil, nil);
    }
     */
    NSLog(@"Qupai SDK compelete %@",[sdk.videoInfo objectForKey:QPVideoInfoDuration]);
    
    QPUploadTask *uploadTask = [[QPUploadTaskManager shared] createUploadTaskWithVideoPath:videoPath thumbnailPath:thumbnailPath share:0 desc:nil tags:nil];
    
    [[QPUploadTaskManager shared] startUploadTask:uploadTask progress:^(CGFloat progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
           NSLog(@"%f",progress);
        });
    } success:^(QPUploadTask *uploadTask, NSString *remoteId) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@",remoteId);
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"upload failed");
        });
    }];
    
}

@end
