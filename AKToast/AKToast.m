//
//  AKToast.m
//  AKToast
//
//  Created by 冷胜任 on 2017/7/13.
//  Copyright © 2017年 Alijk.com. All rights reserved.
//

#import "AKToast.h"
#import "MBProgressHUD.h"
static NSInteger const hudFontSize = 15;
@interface AKToast ()
@property (nonatomic, strong) MBProgressHUD  *hudView;
@end

@implementation AKToast
+(instancetype)shareinstance {
    static AKToast *toast = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toast = [[AKToast alloc] init];
    });
    return toast;
}

+ (void)showToastMsg:(NSString *)msg {
    [self showToastMsg:msg delay:1.8];
}

+ (void)showToastMsg:(NSString *)msg image:(UIImage *)image {
    [self showToastMsg:msg delay:1.8 yOffset:0 hudImage:image];
}

+ (void)showToastSuccessMsg:(NSString *)successMsg {
      UIImage *image = [UIImage imageNamed:[@"AKToastResource.bundle" stringByAppendingPathComponent:@"hudSuccess"]];
    [self showToastMsg:successMsg delay:1.8 yOffset:0 hudImage:image];
}
+ (void)showToastErrorMsg:(NSString *)errorMsg {
    UIImage *image = [UIImage imageNamed:[@"AKToastResource.bundle" stringByAppendingPathComponent:@"hudError"]];
    [self showToastMsg:errorMsg delay:1.8 yOffset:0 hudImage:image];
}


+ (void)showToastMsg:(NSString *)msg delay:(NSTimeInterval)delay {
    [self showToastMsg:msg delay:delay yOffset:0];
}

+ (void)showToastMsg:(NSString *)msg delay:(NSTimeInterval)delay yOffset:(float)yOffset  {
    [self showToastMsg:msg delay:delay yOffset:yOffset hudImage:nil];
}

+ (void)showToastMsg:(NSString *)msg delay:(NSTimeInterval)delay yOffset:(float)yOffset hudImage:(UIImage *)image {
    [self hideToast];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
        [AKToast shareinstance].hudView = [MBProgressHUD showHUDAddedTo:view animated:YES];
        [AKToast shareinstance].hudView.mode = MBProgressHUDModeCustomView;
        [AKToast shareinstance].hudView.labelFont = [UIFont systemFontOfSize:hudFontSize];
        if (image) {
            [AKToast shareinstance].hudView.customView = [[UIImageView alloc] initWithImage:image];
        }
        [AKToast shareinstance].hudView.yOffset = yOffset;
        [AKToast shareinstance].hudView.labelText = msg;
        [AKToast shareinstance].hudView.dimBackground = NO;
        [[AKToast shareinstance].hudView hide:YES afterDelay:delay];
    });

}

+ (void)showToastLoadingMsg:(NSString *)msg {
    [self showToastLoadingMsg:msg graceTime:0];
}

+ (void)showToastLoadingMsg:(NSString *)msg delay:(NSTimeInterval)delay {
    [self showToastLoadingMsg:msg delay:delay graceTime:0 dimBackground:NO mode:MBProgressHUDModeIndeterminate];
}

+ (void)showToastLoadingMsg:(NSString *)msg graceTime:(float)graceTime {
    [self showToastLoadingMsg:msg delay:30 graceTime:graceTime dimBackground:NO mode:MBProgressHUDModeIndeterminate];
}

+ (void)showToastLoadingMsg:(NSString *)msg graceTime:(float)graceTime dimBackground:(BOOL)dimBackground {
    [self showToastLoadingMsg:msg delay:30 graceTime:graceTime dimBackground:dimBackground mode:MBProgressHUDModeIndeterminate];
}

+ (void)showToastLoadingMsg:(NSString *)msg delay:(NSTimeInterval)delay graceTime:(float)graceTime dimBackground:(BOOL)dimBackground mode:(MBProgressHUDMode)mode  {
    [self hideToast];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *view = [[UIApplication sharedApplication].windows lastObject];
        [AKToast shareinstance].hudView = [MBProgressHUD showHUDAddedTo:view animated:YES];
        [AKToast shareinstance].hudView.labelFont = [UIFont systemFontOfSize:hudFontSize];
        [AKToast shareinstance].hudView.labelText = msg;
        [AKToast shareinstance].hudView.mode = mode;
        [AKToast shareinstance].hudView.dimBackground = dimBackground;
        [AKToast shareinstance].hudView.minShowTime = 0.3; //最少执行0.3 秒
        [AKToast shareinstance].hudView.graceTime = graceTime; //设置几秒后开始显示，用户体验更好;
        [[AKToast shareinstance].hudView hide:YES afterDelay:delay];
    });
}

+ (void)hideToast {
    if ([AKToast shareinstance].hudView != nil || ![AKToast shareinstance].hudView.isHidden) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[AKToast shareinstance].hudView hide:YES];
            [AKToast shareinstance].hudView.taskInProgress = NO;
        });

    }
}

@end
