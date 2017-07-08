# PQAlertController

> 简单的介绍一下PQAlertcontroller吧
1 同时支持iphone ，ipad 
2 支持链式调用
3 可以实时监听textField输入回调

```
 UIAlertControllerStyle type = _selectIndex ?UIAlertControllerStyleActionSheet : UIAlertControllerStyleAlert;
    PQAlertController *alert= [PQAlertController alertControllerWithTitle:@"难道我这么帅" message:@"帅，不存在的！" preferredStyle:type];
#if 0
    [[[[[alert addAction:@"取消" actionHandler:^{
        NSLog(@"cancel");
    }] addAction:@"不知道" actionHandler:^{
        NSLog(@"don't know");
    }] addTextInput:@"请输入账号" textChange:^(NSString *text,UITextField *textfield) {
        NSLog(@"%@",text);
        _accountLbl.text = text;
    }] addSecureTextInput:@"请输入密码" textChange:^(NSString *text,UITextField *textfield) {
        NSLog(@"%@",text);
        _pwdLbl.text = text;
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
        _accountLbl.text = text;
    }).addTextInput(@"请输入密码",YES,^(NSString *text,UITextField *textField){
        NSLog(@"%@",text);
        _pwdLbl.text = text;
    });
#endif
    [self presentViewController:alert animated:YES completion:nil];
    ```
