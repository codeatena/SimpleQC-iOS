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

        if ([result[@"state"] isEqualToString:@"success"])
        {
            [self performSegueWithIdentifier:@"scanSegue" sender:nil];
        }
        else
        {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error" message:result[@"result"] preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
        
    }];
    
}

@end
