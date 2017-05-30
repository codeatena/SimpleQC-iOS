//
//  ReceiverViewController.h
//  SimpleQC
//
//  Created by AnCheng on 30/05/2017.
//  Copyright © 2017 AnCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiverViewController : UIViewController

@property (nonatomic) BOOL isPoJob;
@property (nonatomic ,strong) NSString *codeStr;

@property (nonatomic ,weak) IBOutlet UILabel *nameLbl;
@property (nonatomic ,weak) IBOutlet UILabel *jobLbl;
@property (nonatomic ,weak) IBOutlet UILabel *poLbl;
@property (nonatomic ,weak) IBOutlet UILabel *orderLbl;
@property (nonatomic ,weak) IBOutlet UILabel *statusLbl;

@end
