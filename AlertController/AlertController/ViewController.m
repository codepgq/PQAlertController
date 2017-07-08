//
//  ViewController.m
//  AlertController
//
//  Created by cxb on 2017/7/4.
//  Copyright © 2017年 pgq. All rights reserved.
//

#import "ViewController.h"
#import "Result.h"
#import "PQAlertController.h"
@interface ViewController ()

@end

@implementation ViewController{
    NSInteger _selectIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
}
- (void)normal{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"牛逼" message:@"💯就是这么强" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    [alert addAction:action1];
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了确定");
    }];
    [alert addAction:action2];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)segmentClick:(UISegmentedControl *)sender {
    _selectIndex = sender.selectedSegmentIndex;
}
- (IBAction)showAlertController:(id)sender {
    UIAlertControllerStyle type = _selectIndex ?UIAlertControllerStyleActionSheet : UIAlertControllerStyleAlert;
    PQAlertController *alert= [PQAlertController alertControllerWithTitle:@"难道我这么帅" message:@"帅，不存在的！" preferredStyle:type];
#if 0
    [[[[[alert addAction:@"取消" actionHandler:^{
        NSLog(@"cancel");
    }] addAction:@"不知道" actionHandler:^{
        NSLog(@"don't know");
    }] addTextInput:@"请输入账号" textChange:^(NSString *text,UITextField *textfield) {
        NSLog(@"%@",text);
    }] addSecureTextInput:@"请输入密码" textChange:^(NSString *text,UITextField *textfield) {
        NSLog(@"%@",text);
    }] addAction:@"刘辟" actionHandler:^{
        NSLog(@"哈哈哈");
    }];
#else
    alert.addAction(@"取消",^{
        NSLog(@"cancel");
    }).addAction(@"确定",^{
        NSLog(@"ok");
    }).addTextInput(@"请输入账户",NO,^(NSString *text,UITextField *textField){
        NSLog(@"%@",text);
    }).addTextInput(@"请输入密码",YES,^(NSString *text,UITextField *textField){
        NSLog(@"%@",text);
    });
#endif
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)result{
//    Result * res = [[Result alloc] init];
//    [res eat];
//    [res run];
//    
//    [[res eat2] run2];
//    [[[res eat3:@"apple"] eat3:@"banana"] run3:100.0];
    
    
//    void (^a)() = ^{
//        NSLog(@"调用了block");
//    };
//    a();
//    
//    
//    void (^x)() = [res eat4];
//    x();
    
    //    res.eat4();
    //    res.run4();
    
    //    res.eat5().eat4();
    //    res.eat6(@"cake").run6(100);
    
    
//        [res jump:^{
//    
//            NSLog(@"我来控制输出什么");
//        }];
//    
//        [res play:^{
//            NSLog(@"我来决定玩什么");
//        }];
//    
//        [res jump2:^(float metter) {
//            NSLog(@"被控制要跳%.2f米",metter);
//        }];
//    
//        [res play2:^(NSString *string) {
//            NSLog(@"被要求玩%@",string);
//        }];
    
//        [[[[res jump3:^{
//            NSLog(@"我可以跳一米高");
//        }] play3:^{
//            NSLog(@"所以我要去打篮球了");
//        }] jump3:^{
//            NSLog(@"但是我每天都锻炼，所以我可以跳1.4米高了");
//        }] play3:^{
//            NSLog(@"可是我对篮球失去了兴趣，爱上了跳高");
//        }];
    
//        [[res jum4:^(float metter) {
//            NSLog(@"我看你可以跳%.2f米",metter);
//        }] play4:^(NSString *string) {
//            NSLog(@"所以你去%@吧",string);
//        }];
//    
//        res.jum5(123,^(float metter){
//            NSLog(@"我自己决定我跳%.2f米",metter);
//        });
//        res.play5(@"我给你100块",^(NSString * str){
//            NSLog(@"%@,你给我一个篮球",str);
//        });
//    
//    res.jum6(100,^(float money){
//        NSLog(@"我给你 100块 ，你要给我%.2f",money);
//    }).play6(@"JACK",^(NSString * name){
//        NSLog(@"给我签个名字吧，我的名字是Jack,%@",name);
//    });
}


@end
