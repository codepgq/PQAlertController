//
//  Result.h
//  AlertController
//
//  Created by cxb on 2017/7/4.
//  Copyright © 2017年 pgq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Result : NSObject

#pragma mark - 普通对象方法
- (void)eat;
- (void)run;

#pragma mark - 普通对象方法 链式语法 不带参数
- (Result *)eat2;
- (Result *)run2;

#pragma mark - 普通对象方法 链式语法 带参数
- (Result *)eat3:(NSString *)food;
- (Result *)run3:(float)metter;

#pragma mark - 点语法
- (void(^)())eat4;
- (void(^)())run4;

#pragma mark - 点语法 链式 不带参数
- (Result*(^)())eat5;
- (Result*(^)())run5;

#pragma mark - 点语法 链式 带参数
- (Result*(^)(NSString * food))eat6;
- (Result*(^)(float metter))run6;


// ******************* 后置block *******************

#pragma mark - 普通对象方法 - 外界处理 不带参数
- (void)jump:(void(^)())block;
- (void)play:(void(^)())block;

#pragma mark - 普通对象方法 - 外界处理 带参数
- (void)jump2:(void(^)(float metter))block;
- (void)play2:(void(^)(NSString *string))block;

#pragma mark - 普通对象方法 - 外界处理 不带参数 链式
- (Result*)jump3:(void(^)())block;
- (Result*)play3:(void(^)())block;

#pragma mark - 普通对象方法 - 外界处理 带参数 链式
- (Result*)jum4:(void(^)(float metter))block;
- (Result*)play4:(void(^)(NSString * string))block;

// ******************* 前置block *******************

#pragma mark - 点语法 - 传入参数，内部自己处理，返回参数，自己决定做什么
-(void(^)(float metter, void(^)(float metter)))jum5;
-(void(^)(NSString* str, void(^)(NSString* str)))play5;

#pragma mark - 点语法 - 传入参数，内部自己处理，返回参数，自己决定做什么 链式
-(Result*(^)(float metter, void(^)(float metter)))jum6;
-(Result*(^)(NSString* str, void(^)(NSString* str)))play6;


@end
