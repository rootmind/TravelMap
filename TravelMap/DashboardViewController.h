//
//  DashboardViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface DashboardViewController : UIViewController  //<UITableViewDelegate,UITableViewDataSource>

//@property (strong, nonatomic) IBOutlet UITableView *CustTableView;


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *lastLoginDate;

//@property (strong, nonatomic) NSArray *accountName;
//@property (strong, nonatomic) NSArray *accountNumber;
//@property (strong, nonatomic) NSArray *accountCurrency;
//@property (strong, nonatomic) NSArray *accountAvlBalance;
//@property (strong, nonatomic) NSArray *accountCurrentBalance;
//@property (strong, nonatomic) NSArray *accountStatus;

@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;


//- (IBAction)btnWallet:(id)sender;
//
//- (IBAction)btnCreditCard:(id)sender;



@end