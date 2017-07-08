//
//  Result.m
//  AlertController
//
//  Created by cxb on 2017/7/4.
//  Copyright © 2017年 pgq. All rights reserved.
//

#import "Result.h"

@implementation Result

- (void)eat{
    NSLog(@"eat");
}

- (void)run{
    NSLog(@"run");
}

- (Result *)eat2{
    [self eat];
    return self;
}
- (Result *)run2{
    [self run];
    return self;
}

- (Result *)eat3:(NSString *)food{
    NSLog(@"eat :%@",food);
    return self;
}

- (Result *)run3:(float)metter{
    NSLog(@"run %f metter",metter);
    return self;
}


- (void(^)())eat4{
    void(^eat4Block)() = ^(void){
        NSLog(@"eat4");
    };
    return eat4Block;
}
- (void(^)())run4{
    
    return ^(void){
        NSLog(@"run4");
    };
}


- (Result*(^)())eat5{
    
    Result *(^eat5Block)() = ^{
        NSLog(@"eat5");
        return self;
    };
    
    return eat5Block;
}
- (Result*(^)())run5{
    return  ^{
        NSLog(@"run 5");
        return self;
    };
}

- (Result*(^)(NSString * food))eat6{
    Result *(^eat6Block)(NSString * food) = ^(NSString * food){
        NSLog(@"eat6 %@",food);
        return self;
    };
    return eat6Block;
}
- (Result*(^)(float metter))run6{
    return ^(float metter){
        NSLog(@"run6 %.2f",metter);
        return self;
    };
}


- (void)jump:(void(^)())block{
    if (block) {
        block();
    }
}

- (void)play:(void(^)())block{
    if (block) {
        block();
    }
}

- (void)jump2:(void(^)(float metter))block{
    if (block) {
        block(100);
    }
}
- (void)play2:(void(^)(NSString *string))block{
    if (block) {
        block(@"basketball");
    }
}

- (Result*)jump3:(void(^)())block{
    if (block) {
        block();
    }
    return self;
}
- (Result*)play3:(void(^)())block{
    if (block) {
        block();
    }
    return self;
}

- (Result*)jum4:(void(^)(float metter))block{
    if (block) {
        block(1);
    }
    return self;
}
- (Result*)play4:(void(^)(NSString * string))block{
    if (block) {
        block(@"游泳");
    }
    return self;
}

-(void(^)(float metter, void(^)(float metter)))jum5{
    void (^jum5Block)(float metter, void(^)(float metter)) = ^(float metter, void(^neibuBlock)(float metter)){
        if (neibuBlock) {
            neibuBlock(metter);
        }
    };
    return jum5Block;
}
-(void(^)(NSString* str, void(^)(NSString* str)))play5{
    return ^(NSString* str, void(^neibuBlock)(NSString* str)){
        if (neibuBlock) {
            neibuBlock(str);
        }
    };
}

-(Result*(^)(float metter, void(^)(float metter)))jum6{
    Result* (^jum6Block)(float metter, void(^)(float metter)) = ^(float metter, void(^neibuBlock)(float metter)){
        if (neibuBlock) {
            neibuBlock(metter * 1.2);
        }
        
        return self;
    };
    return jum6Block;
}
-(Result*(^)(NSString* str, void(^)(NSString* str)))play6{
    return ^(NSString * str, void(^neibuBlock)(NSString * str)){
        
        if (neibuBlock) {
            neibuBlock([NSString stringWithFormat:@"加一个漂亮的签名 %@",str]);
        }
        
        return self;
    };
}

@end
