//
//  PQAlertController.m
//  AlertController
//
//  Created by cxb on 2017/7/4.
//  Copyright © 2017年 pgq. All rights reserved.
//

#import "PQAlertController.h"
@interface PQAlertController ()
@property (nonatomic, strong) NSMutableDictionary *allTextField;
@end

@implementation PQAlertController{
    NSInteger _textFieldTag;
}

- (NSInteger)nextTagId{
    return _textFieldTag;
}

- (NSString *)getTextfieldKey:(NSInteger)tag{
    return [NSString stringWithFormat:@"TextFieldTag-%zd",tag];
}

- (void)setSourceRect:(CGRect)sourceRect{
    _sourceRect = sourceRect;
    if (self.popoverPresentationController) {
        self.popoverPresentationController.sourceRect = sourceRect;
    }
}

- (void)setSourceView:(UIView *)sourceView{
    _sourceView = sourceView;
    if (self.popoverPresentationController) {
        self.popoverPresentationController.sourceView = sourceView;
    }
}

+ (PQAlertController *)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle{
    
    PQAlertController * alert = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    alert.allTextField = [NSMutableDictionary dictionary];
    
    //兼容ipad
    if (alert.popoverPresentationController) {
        alert.sourceView = [UIApplication sharedApplication].keyWindow.rootViewController.view;
        CGRect bounds = [UIScreen mainScreen].bounds;
        alert.sourceRect = CGRectMake(bounds.size.width * 0.5,bounds.size.height,1.0,1.0);
    }
    
    return alert;
}

- (void)setup{
    _allTextField = [NSMutableDictionary dictionary];
}

- (void)dealloc{
    NSLog(@"%@ - %s",[self class],__func__);
}

#pragma mark - 对外公开的方法

- (PQAlertController *)addAction:(NSString *)title actionHandler:(void(^)())block{
    
    UIAlertActionStyle style = (self.actions.count == 0) ? UIAlertActionStyleCancel : UIAlertActionStyleDefault;
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
        if (block) {
            block();
        }
    }];
    [self addAction:action];
    return self;
}

- (PQAlertController *)addTextInput:(NSString *)placeHolder textChange:(void(^)(NSString * text, UITextField * textFiled))block{
    return [self textInput:placeHolder secure:NO textChange:block];
}

- (PQAlertController *)addSecureTextInput:(NSString *)placeHolder textChange:(void(^)(NSString * text, UITextField * textFiled))block{
    return [self textInput:placeHolder secure:YES textChange:block];
}

- (PQAlertController *)textInput:(NSString *)placeHolder secure:(BOOL)secure textChange:(void(^)(NSString * text, UITextField * textFiled))block{
    
    if (self.preferredStyle == UIAlertControllerStyleActionSheet) {
        return self;
    }
    
    __weak typeof(self) wSelf = self;
    [self addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSInteger tag = [wSelf nextTagId];
        textField.placeholder = placeHolder;
        textField.secureTextEntry = secure;
        textField.tag = tag;
        [wSelf.allTextField setValue:block forKey:[wSelf getTextfieldKey:tag]];
        [textField addTarget:wSelf action:@selector(pq_TextFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
    }];
    return self;
}


- (void)pq_TextFieldTextChange:(UITextField *)textFiled{
    NSString * key = [self getTextfieldKey:textFiled.tag];
    void(^block)(NSString *text,UITextField * textField) = [self.allTextField valueForKey:key];
    if (block) {
        block(textFiled.text,textFiled);
    }
}

#pragma mark - 前置block
- (PQAlertController*(^)(NSString * title,void(^)()))addAction{
    return ^(NSString * title,void(^actionBlock)()){
        UIAlertActionStyle style = (self.actions.count == 0) ? UIAlertActionStyleCancel : UIAlertActionStyleDefault;
        UIAlertAction * action = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
            if (actionBlock) {
                actionBlock();
            }
        }];
        [self addAction:action];
        return self;
    };
}


- (PQAlertController*(^)(NSString * placeHolder,BOOL secure,void(^)(NSString *text,UITextField *textField)))addTextInput{
    return ^(NSString * placeHolder,BOOL secure,void(^textBlock)(NSString *text,UITextField *textField)){
        if (self.preferredStyle == UIAlertControllerStyleActionSheet) {
            return self;
        }
        
        __weak typeof(self) wSelf = self;
        [self addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            NSInteger tag = [wSelf nextTagId];
            textField.placeholder = placeHolder;
            textField.secureTextEntry = secure;
            textField.tag = tag;
            [wSelf.allTextField setValue:textBlock forKey:[wSelf getTextfieldKey:tag]];
            [textField addTarget:wSelf action:@selector(pq_TextFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
        }];
        return self;
    };
}
@end
