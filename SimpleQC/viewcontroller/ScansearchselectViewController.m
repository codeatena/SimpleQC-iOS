//
//  ScansearchselectViewController.m
//  SimpleQC
//
//  Created by AnCheng on 30/05/2017.
//  Copyright © 2017 AnCheng. All rights reserved.
//

#import "ScansearchselectViewController.h"
#import "DownPicker.h"
#import "ReceiverViewController.h"

@interface ScansearchselectViewController ()

@property (nonatomic ,strong)  DownPicker *selectPicker;
@property (nonatomic ,weak) IBOutlet UITextField *pojobField;

@end

@implementation ScansearchselectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _selectPicker = [[DownPicker alloc] initWithTextField:_pojobField];
    [_selectPicker setData:@[@"PO Number" , @"Job Number"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"receiverSegue"])
    {
        ReceiverViewController *vc = (ReceiverViewController *)[segue destinationViewController];
        vc.codeStr = sender;
        vc.isPoJob = [_pojobField.text isEqualToString:@"PO Number"];
    }
}

@end
