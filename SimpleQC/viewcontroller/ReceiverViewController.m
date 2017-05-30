//
//  ReceiverViewController.m
//  SimpleQC
//
//  Created by AnCheng on 30/05/2017.
//  Copyright © 2017 AnCheng. All rights reserved.
//

#import "ReceiverViewController.h"

@interface ReceiverViewController ()

@end

@implementation ReceiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getProject];
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

- (IBAction)onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getProject
{
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    if (_isPoJob)
    {
        [[APIService sharedManager] getProjectByPO:_codeStr complete:^(NSArray *result,NSError *error){
            
            [self parseDic:result[0]];
            
            [MBProgressHUD hideHUDForView:self.view animated:NO];
        }];
    }
    else
    {
        [[APIService sharedManager] getProjectByJob:_codeStr complete:^(NSArray *result,NSError *error){
            
            [self parseDic:result[0]];

            [MBProgressHUD hideHUDForView:self.view animated:NO];

        }];
    }
}

- (void)parseDic:(NSDictionary *)dic
{
    _nameLbl.text = dic[@"name"];
    _poLbl.text = dic[@"po_number"];
    _jobLbl.text = dic[@"job_number"];
    _orderLbl.text = dic[@"order_quantity"];
    int status = [dic[@"status"] intValue];
    _statusLbl.text = PROJECT_STATUS[status];
    
}

@end
