//
//  AKToast.h
//  AKToast
//
//  Created by 冷胜任 on 2017/7/13.
//  Copyright © 2017年 Alijk.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AKToast : NSObject
+(instancetype)shareinstance;

/**
 提示通用文本信息

 @param msg 提示信息字符串
 */
+ (void)showToastMsg:(NSString *)msg;

/**
  提示通用文本信息带图片

 @param msg 提示信息
 @param image icon自定义
 */
+ (void)showToastMsg:(NSString *)msg image:(UIImage *)image;
/**
  提示成功文本信息

 @param successMsg 成功信息字符串
 */
+ (void)showToastSuccessMsg:(NSString *)successMsg;

/**
 提示错误文本信息

 @param errorMsg 错误信息字符串
 */
+ (void)showToastErrorMsg:(NSString *)errorMsg;

/**
 提示文本信息可设置消失时间

 @param msg 提示消息字符串
 @param delay 延时时间
 */
+ (void)showToastMsg:(NSString *)msg delay:(NSTimeInterval)delay;

/**
  提示文本信息可设置消失时间 和y 偏移量

 @param msg  提示信息字符串
 @param delay 延迟时间
 @param yOffset 偏移量
 */
+ (void)showToastMsg:(NSString *)msg delay:(NSTimeInterval)delay yOffset:(float)yOffset;

/**
 长时间等待菊花

 @param msg 提示信息字符串
 */
+ (void)showToastLoadingMsg:(NSString *)msg;

/**
 长时间等待菊花

 @param msg 提示信息字符串
 @param delay 超时时间
 */
+ (void)showToastLoadingMsg:(NSString *)msg delay:(NSTimeInterval)delay;

/**
  长时间等待菊花 可设置延时显示，如果时间很短就结束请求，就不显示该菊花 体验更好

 @param msg 提示信息字符串
 @param graceTime 延时显示时间
 */
+ (void)showToastLoadingMsg:(NSString *)msg graceTime:(float)graceTime;


/**
   长时间等待菊花 是否开启蒙层

 @param msg 提示信息字符串
 @param graceTime 延时显示时间 0 直接显示
 @param dimBackground YES 显示蒙城
 */
+ (void)showToastLoadingMsg:(NSString *)msg
                  graceTime:(float)graceTime
              dimBackground:(BOOL)dimBackground;




/**
 隐藏toast
 */
+ (void)hideToast;

@end
