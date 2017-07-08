//
//  PQAlertController.h
//  AlertController
//
//  Created by cxb on 2017/7/4.
//  Copyright © 2017年 pgq. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PQAlertController : UIAlertController

/**
 ipad上面需要填写的参数
 */
@property (nonatomic, assign) CGRect sourceRect;

/**
 ipad上面需要填写的参数
 */
@property (nonatomic, strong) UIView *sourceView;

//后置block

/**
 添加一个按钮

 @param title 按钮标题
 @param block 回调
 @return 当前对象
 */
- (PQAlertController *)addAction:(NSString *)title actionHandler:(void(^)())block;

/**
 添加一个输入框明文显示

 @param placeHolder placeholder
 @param block 回调
 @return 当前对象
 */
- (PQAlertController *)addTextInput:(NSString *)placeHolder textChange:(void(^)(NSString * text, UITextField * textFiled))block;

/**
 添加一个输入框，密文显示

 @param placeHolder plackholder
 @param block 回调
 @return 当前对象
 */
- (PQAlertController *)addSecureTextInput:(NSString *)placeHolder textChange:(void(^)(NSString * text, UITextField * textFiled))block;


#pragma mark - 前置block

/**
 添加一个action，
 参数1 title 标题
 参数2 block 回调
 */
- (PQAlertController*(^)(NSString * title,void(^)()))addAction;
/**
 添加一个文本输入框
 参数1 placeholder 大家都懂的
 参数2 是否密文显示
 参数3 block 回调
 */
- (PQAlertController*(^)(NSString * placeHolder,BOOL secure,void(^)(NSString *text,UITextField *textField)))addTextInput;
@end
