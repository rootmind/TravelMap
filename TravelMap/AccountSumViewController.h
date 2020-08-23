//
//  AccountSumViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/15/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AccountsData.h"



@interface AccountSumViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;

//@property (strong, nonatomic) NSArray *accountName;
//@property (strong, nonatomic) NSArray *accountNumber;
//@property (strong, nonatomic) NSArray *accountCurrency;
//@property (strong, nonatomic) NSArray *accountAvlBalance;
//@property (strong, nonatomic) NSArray *accountCurrentBalance;
//@property (strong, nonatomic) NSArray *accountStatus;

//@property (strong, nonatomic) NSString *customerName;
//@property (strong, nonatomic) NSString *customerSegment;

//@property (strong, nonatomic) NSString *availableBalance;
//@property (strong, nonatomic) NSArray *accountsKeyData;
//@property (strong, nonatomic) NSArray *accountsValueData;
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *accountsArray;
@property (strong, nonatomic) AccountsData *accounts;

@end
