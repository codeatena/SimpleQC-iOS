//
//  LoginViewController.m
//  SimpleQC
//
//  Created by AnCheng on 30/05/2017.
//  Copyright © 2017 AnCheng. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:KEY_USERID];
    if (userId != nil)
        _idField.text = userId;
    
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:KEY_PASSWORD];
    if (password != nil)
        _passwordField.text = password;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onLogin:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];

    [[APIService sharedManager] authoLogin:_idField.text password:_passwordField.text complete:^(NSDictionary *result,NSError *error){
        
        
        [MBProgressHUD hideHUDForView:self.view animated:NO];

        if (error == nil)
        {
            if ([result[@"state"] isEqualToString:@"success"])
            {
                [[NSUserDefaults standardUserDefaults] setValue:_idField.text forKey:KEY_USERID];
                [[NSUserDefaults standardUserDefaults] setValue:_passwordField.text forKey:KEY_PASSWORD];

                [self performSegueWithIdentifier:@"scanSegue" sender:nil];
            }
            else
            {
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:result[@"result"] preferredStyle:UIAlertControllerStyleAlert];
                [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
                [self presentViewController:alertVC animated:YES completion:nil];
            }
        }
        else
        {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
        
    }];
    
}

@end
