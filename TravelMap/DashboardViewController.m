//
//  DashboardViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DashboardViewController.h"
#import "AccountSumViewController.h"
#import "CCSumViewController.h"
#import "TransferViewController.h"
#import "LoansSumViewController.h"
#import "BillerViewController.h"
#import "PieChartViewController.h"
#import "MagicPieLayer.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"


@interface DashboardViewController ()

@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red



@implementation DashboardViewController


@synthesize userid;
@synthesize sessionid;
@synthesize activityIndicator;
@synthesize lastLoginDate;

//@synthesize accountName;
//@synthesize accountNumber;
//@synthesize accountCurrency;
//@synthesize accountAvlBalance;
//@synthesize accountCurrentBalance;
//@synthesize accountStatus;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];
    //[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1];//[UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    

    
    /*UIImageView *wallet =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,80,80)];
    wallet.image=[UIImage imageNamed:@"money-wallet-icon.png"];
    wallet.contentMode=UIViewContentModeCenter;
    wallet.layer.masksToBounds=YES;
    [wallet.layer setBorderColor:[UIColor grayColor].CGColor];
    [wallet.layer setBorderWidth:2.0f];
    [wallet.layer setCornerRadius:15.0f];
    [wallet.layer setShadowColor:[UIColor grayColor].CGColor];
    [self.view addSubview:wallet];*/
 
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
//    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
//    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];
//    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
//    companyLogo.clipsToBounds = NO;
//    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    ////self.navigationItem.titleView=companyLogo;
    
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    
    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
//    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
//    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
//    //companyLogo.contentMode=UIViewContentModeCenter;
//    companyLogo.contentMode = UIViewContentModeScaleToFill;
//    companyLogo.clipsToBounds = NO;
//    companyLogo.layer.masksToBounds=NO;
//    //[self.view addSubview:companyLogo];  
//    //self.navigationItem.titleView=companyLogo;
    
    
    //-------accounts
    UIButton *btnAccounts = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //btnAccounts.frame = CGRectMake(40,80,60,60);
    [btnAccounts setTitle:@"Accounts" forState:UIControlStateNormal];
    [btnAccounts setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnAccounts.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *AccountsImage = [[UIImage imageNamed:@"accounts-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnAccounts setImage:AccountsImage forState:UIControlStateNormal ];
    [btnAccounts.titleLabel setFont:[UIFont boldSystemFontOfSize:14]]; //[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
    btnAccounts.backgroundColor = [UIColor whiteColor];
    [btnAccounts.layer setBorderColor:[UIColor borderColor].CGColor];//[UIColor blueColor].CGColor];
    //[money setTintColor:[UIColor redColor]];
    [btnAccounts.layer setBorderWidth:2.0f];
    [btnAccounts.layer setCornerRadius:15.0f];
    [btnAccounts.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnAccounts.layer setShadowOpacity:0.8f];
    [btnAccounts.layer setShadowRadius:12.0f];
    btnAccounts.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnAccounts.contentMode=UIViewContentModeCenter;
    btnAccounts.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingAccounts = 6.0;
    CGSize imageAccountsSize = AccountsImage.size;
    btnAccounts.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageAccountsSize.width, - (imageAccountsSize.height + spacingAccounts), 0.0);
    CGSize titleAccountsSize = [btnAccounts.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnAccounts.titleLabel.font}];
    btnAccounts.imageEdgeInsets = UIEdgeInsetsMake(- (titleAccountsSize.height + spacingAccounts), 0.0, 0.0, - titleAccountsSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnAccounts addTarget:self action:@selector(btnAccounts:) forControlEvents:UIControlEventTouchUpInside];

    btnAccounts.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnAccounts];
    
    
 

    //---------
 
    //------credit card
    UIButton *btnCreditCard = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //btnCreditCard.frame = CGRectMake(120,80,60,60);
    [btnCreditCard setTitle:@"Credit Card" forState:UIControlStateNormal];
    [btnCreditCard setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnCreditCard.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *ccImage = [[UIImage imageNamed:@"credit-cards-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnCreditCard setImage:ccImage forState:UIControlStateNormal ];
    [btnCreditCard.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
    btnCreditCard.backgroundColor = [UIColor whiteColor];
    [btnCreditCard.layer setBorderColor:[UIColor borderColor].CGColor];//[UIColor blueColor].CGColor];
    //[money setTintColor:[UIColor redColor]];
    [btnCreditCard.layer setBorderWidth:2.0f];
    [btnCreditCard.layer setCornerRadius:15.0f];
    [btnCreditCard.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnCreditCard.layer setShadowOpacity:0.8f];
    [btnCreditCard.layer setShadowRadius:12.0f];
    btnCreditCard.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnCreditCard.contentMode=UIViewContentModeCenter;
    btnCreditCard.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingCC = 6.0;
    CGSize imageCCSize = ccImage.size;
    btnCreditCard.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageCCSize.width, - (imageCCSize.height + spacingCC), 0.0);
    CGSize titleCCSize = [btnCreditCard.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnCreditCard.titleLabel.font}];
    btnCreditCard.imageEdgeInsets = UIEdgeInsetsMake(- (titleCCSize.height + spacingCC), 0.0, 0.0, - titleCCSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnCreditCard addTarget:self action:@selector(btnCreditCard:) forControlEvents:UIControlEventTouchUpInside];
    btnCreditCard.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnCreditCard];
    //-----------


    

    
    //-----deposits
    UIButton *btnDeposit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //btnDeposit.frame = CGRectMake(200,80,60,60);
    [btnDeposit setTitle:@"Deposits" forState:UIControlStateNormal];
    [btnDeposit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnDeposit.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *depositImage = [[UIImage imageNamed:@"deposit-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnDeposit setImage:depositImage forState:UIControlStateNormal ];
    [btnDeposit.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
    btnDeposit.backgroundColor = [UIColor whiteColor];
    [btnDeposit.layer setBorderColor:[UIColor borderColor].CGColor];//[UIColor blueColor].CGColor];
    //[money setTintColor:[UIColor redColor]];
    [btnDeposit.layer setBorderWidth:2.0f];
    [btnDeposit.layer setCornerRadius:15.0f];
    [btnDeposit.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnDeposit.layer setShadowOpacity:0.8f];
    [btnDeposit.layer setShadowRadius:12.0f];
    btnDeposit.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnDeposit.contentMode=UIViewContentModeCenter;
    btnDeposit.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacing = 6.0;
    CGSize imageSize = depositImage.size;
    btnDeposit.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    CGSize titleSize = [btnDeposit.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnDeposit.titleLabel.font}];
    btnDeposit.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnDeposit addTarget:self action:@selector(btnDeposit:) forControlEvents:UIControlEventTouchUpInside];
    btnDeposit.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnDeposit];
    //-------
    
    
    

    //-------transfers
    UIButton *btnTransfer = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //btnTransfer.frame = CGRectMake(40,170,60,60);
    [btnTransfer setTitle:@"Trasnsfer" forState:UIControlStateNormal];
    [btnTransfer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnTransfer.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *transferImage = [[UIImage imageNamed:@"transfer-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnTransfer setImage:transferImage forState:UIControlStateNormal ];
    [btnTransfer.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
    btnTransfer.backgroundColor = [UIColor whiteColor];
    [btnTransfer.layer setBorderColor:[UIColor borderColor].CGColor];
    //[money setTintColor:[UIColor redColor]];
    [btnTransfer.layer setBorderWidth:2.0f];
    [btnTransfer.layer setCornerRadius:15.0f];
    [btnTransfer.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnTransfer.layer setShadowOpacity:0.8f];
    [btnTransfer.layer setShadowRadius:12.0f];
    btnTransfer.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnTransfer.contentMode=UIViewContentModeCenter;
    btnTransfer.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingTransfer = 6.0;
    CGSize imageTransferSize = transferImage.size;
    btnTransfer.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageTransferSize.width, - (imageTransferSize.height + spacingTransfer), 0.0);
    CGSize titleTransferSize = [btnTransfer.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnTransfer.titleLabel.font}];
    btnTransfer.imageEdgeInsets = UIEdgeInsetsMake(- (titleTransferSize.height + spacingTransfer), 0.0, 0.0, - titleTransferSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnTransfer addTarget:self action:@selector(btnTransfer:) forControlEvents:UIControlEventTouchUpInside];
    btnTransfer.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnTransfer];
    //---------
    
    //------Bill payments
    UIButton *btnBillpay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //btnBillpay.frame = CGRectMake(120,170,60,60);
    [btnBillpay setTitle:@"Bill Pay" forState:UIControlStateNormal];
    [btnBillpay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnBillpay.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *billImage = [[UIImage imageNamed:@"billpay-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnBillpay setImage:billImage forState:UIControlStateNormal ];
    [btnBillpay.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
    btnBillpay.backgroundColor = [UIColor whiteColor];
    [btnBillpay.layer setBorderColor:[UIColor borderColor].CGColor];
    //[money setTintColor:[UIColor redColor]];
    [btnBillpay.layer setBorderWidth:2.0f];
    [btnBillpay.layer setCornerRadius:15.0f];
    [btnBillpay.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnBillpay.layer setShadowOpacity:0.8f];
    [btnBillpay.layer setShadowRadius:12.0f];
    btnBillpay.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnBillpay.contentMode=UIViewContentModeCenter;
    btnBillpay.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingBill = 6.0;
    CGSize imageBillSize = billImage.size;
    btnBillpay.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageBillSize.width, - (imageBillSize.height + spacingBill), 0.0);
    CGSize titleBillSize = [btnBillpay.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnBillpay.titleLabel.font}];
    btnBillpay.imageEdgeInsets = UIEdgeInsetsMake(- (titleBillSize.height + spacingBill), 0.0, 0.0, - titleBillSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnBillpay addTarget:self action:@selector(btnBillPay:) forControlEvents:UIControlEventTouchUpInside];
    btnBillpay.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnBillpay];
    //-----------
    
    //-----trade
    UIButton *btnTrade = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //btnTrade.frame = CGRectMake(200,170,60,60);
    [btnTrade setTitle:@"Loans" forState:UIControlStateNormal];
    [btnTrade setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnTrade.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *tradeImage = [[UIImage imageNamed:@"trade-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnTrade setImage:tradeImage forState:UIControlStateNormal ];
    [btnTrade.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
    btnTrade.backgroundColor = [UIColor whiteColor];
    [btnTrade.layer setBorderColor:[UIColor borderColor].CGColor];
    //[money setTintColor:[UIColor redColor]];
    [btnTrade.layer setBorderWidth:2.0f];
    [btnTrade.layer setCornerRadius:15.0f];
    [btnTrade.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnTrade.layer setShadowOpacity:0.8f];
    [btnTrade.layer setShadowRadius:12.0f];
    btnTrade.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnTrade.contentMode=UIViewContentModeCenter;
    btnTrade.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingTrade = 6.0;
    CGSize imageTradeSize = tradeImage.size;
    btnTrade.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageTradeSize.width, - (imageTradeSize.height + spacingTrade), 0.0);
    CGSize titleTradeSize = [btnTrade.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnTrade.titleLabel.font}];
    btnTrade.imageEdgeInsets = UIEdgeInsetsMake(- (titleTradeSize.height + spacingTrade), 0.0, 0.0, - titleTradeSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnTrade addTarget:self action:@selector(btnLoans:) forControlEvents:UIControlEventTouchUpInside];
    btnTrade.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnTrade];
    //-------

    
    //-------loans
    UIButton *btnLoans = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //btnTransfer.frame = CGRectMake(40,170,60,60);
    [btnLoans setTitle:@"Loans" forState:UIControlStateNormal];
    [btnLoans setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLoans.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *loansImage = [[UIImage imageNamed:@"loans-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnLoans setImage:loansImage forState:UIControlStateNormal ];
    [btnLoans.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
    btnLoans.backgroundColor = [UIColor whiteColor];
    [btnLoans.layer setBorderColor:[UIColor borderColor].CGColor];
    //[money setTintColor:[UIColor redColor]];
    [btnLoans.layer setBorderWidth:2.0f];
    [btnLoans.layer setCornerRadius:15.0f];
    [btnLoans.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnLoans.layer setShadowOpacity:0.8f];
    [btnLoans.layer setShadowRadius:12.0f];
    btnLoans.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnLoans.contentMode=UIViewContentModeCenter;
    btnLoans.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingLoans = 6.0;
    CGSize imageLoansSize = loansImage.size;
    btnLoans.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageLoansSize.width, - (imageLoansSize.height + spacingTransfer), 0.0);
    CGSize titleLoansSize = [btnLoans.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnLoans.titleLabel.font}];
    btnLoans.imageEdgeInsets = UIEdgeInsetsMake(- (titleLoansSize.height + spacingLoans), 0.0, 0.0, - titleLoansSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnLoans addTarget:self action:@selector(btnLoans:) forControlEvents:UIControlEventTouchUpInside];
    btnLoans.translatesAutoresizingMaskIntoConstraints=NO;
    //[self.view addSubview:btnLoans];
    //---------
    
    
    UILabel *lblLastLogin = [[UILabel alloc] init];//WithFrame:CGRectMake(20, 500, 300, 20)];
    //lblUserid.borderStyle = UITextBorderStyleRoundedRect;
    lblLastLogin.font = [UIFont boldSystemFontOfSize:12];//[UIFont systemFontOfSize:12];
    lblLastLogin.text=[NSString stringWithFormat:@"Your last login was on %@",lastLoginDate];
    lblLastLogin.contentMode=UIControlContentHorizontalAlignmentCenter;
    //lblUserid.placeholder = @"Enter userid";
    //lblUserid.autocorrectionType = UITextAutocorrectionTypeNo;
    //lblUserid.keyboardType = UIKeyboardTypeDefault;
    //lblUserid.returnKeyType = UIReturnKeyDone;
    //lblUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
    //lblUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtUserid.delegate = self;
    lblLastLogin.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblLastLogin];
    

    //------Accounts
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.4 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
    
    //------Credit cards
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
    
    //------Deposits
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.6 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
   
    
    //------Transfers
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.4 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];


    //------Bill Pay
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];

    //------Trade
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.6 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];

    
    //------Loans
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.4 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];

    
    //-------last login
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblLastLogin attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:0.9 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblLastLogin attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    

    
//    PieLayer* pieLayer = [[PieLayer alloc] init];
//    //pieLayer.frame = CGRectMake(75, 300, 200, 200);
//    
//        //pieLayer.frame=CGRectMake(headerView.frame.origin.x, headerView.frame.origin.x, headerView.frame.size.width, headerView.frame.size.height);
//    //pieLayer.contentsGravity=kCAGravityResizeAspectFill;
//    [self.view.layer addSublayer:pieLayer];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
//    
//    
//    [pieLayer addValues:@[[PieElement pieElementWithValue:5.0 color:[UIColor redColor]],
//                          [PieElement pieElementWithValue:4.0 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:7.0 color:[UIColor greenColor]]] animated:YES];
//    
//    PieElement* pieElem = pieLayer.values[0];
//    [PieElement animateChanges:^{
//        pieElem.val = 13.0;
//        pieElem.color = [UIColor yellowColor];
//    }];

}

-(void)loadView {
    [super loadView];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    //[self.activityIndicator setHidesWhenStopped:YES];
}


- (IBAction)btnAccounts:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    

    //[self performSegueWithIdentifier:@"ACSumSegue" sender:sender];
  
    //AccountSumViewController *accountSumViewController = [segue destinationViewController];
    //accountSumViewController.userid=(NSString *) self.userid;
    //accountSumViewController.sessionid=(NSString *) self.sessionid;

    
    [self.activityIndicator startAnimating];
    
    AccountSumViewController *accountSumViewController = [[AccountSumViewController alloc]initWithNibName:nil bundle:nil];
    accountSumViewController.userid=self.userid;
    accountSumViewController.sessionid=self.sessionid;
    accountSumViewController.actionMode=@"TRNHISTORY";
    
    [self.navigationController pushViewController:accountSumViewController animated:YES];
    
    [self.activityIndicator stopAnimating];
    
}

- (IBAction)btnCreditCard:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    CCSumViewController *ccSumViewController = [[CCSumViewController alloc]initWithNibName:nil bundle:nil];
    ccSumViewController.userid=self.userid;
    [self.navigationController pushViewController:ccSumViewController animated:YES];
    
    
    
    
}

- (IBAction)btnTransfer:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
//    TransferViewController *transferViewController = [[TransferViewController alloc]initWithNibName:nil bundle:nil];
//    transferViewController.userid=self.userid;
//    transferViewController.sessionid=self.sessionid;
//    [self.navigationController pushViewController:transferViewController animated:YES];
//    
    
    AccountSumViewController *accountSumViewController = [[AccountSumViewController alloc]initWithNibName:nil bundle:nil];
    accountSumViewController.userid=self.userid;
    accountSumViewController.sessionid=self.sessionid;
    accountSumViewController.actionMode=@"TRANSFER";
    
    [self.navigationController pushViewController:accountSumViewController animated:YES];

    
    
}


- (IBAction)btnBillPay:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    BillerViewController *billerViewController = [[BillerViewController alloc]initWithNibName:nil bundle:nil];
    billerViewController.userid=self.userid;
    billerViewController.sessionid=self.sessionid;
    [self.navigationController pushViewController:billerViewController animated:YES];
    
    
    
    
}


- (IBAction)btnLoans:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    
    LoansSumViewController *loansSumViewController = [[LoansSumViewController alloc]initWithNibName:nil bundle:nil];
    loansSumViewController.userid=self.userid;
    loansSumViewController.sessionid=self.sessionid;
    [self.navigationController pushViewController:loansSumViewController animated:YES];
    
    
    
    
}


- (IBAction)btnDeposit:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    PieChartViewController *pieChartViewController = [[PieChartViewController alloc]initWithNibName:nil bundle:nil];
    //pieChartViewController.userid=self.userid;
    [self.navigationController pushViewController:pieChartViewController animated:YES];
    
    
    
    
}

    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
    //card.contentMode=UIViewContentModeCenter;
    //[self.view addSubview:card];
    
    
    
//    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.frame = CGRectMake(40,300,240,300);
//    tableView.backgroundColor = [UIColor whiteColor];//[UIColor lightGrayColor];
//    tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    //
//    
//    //
//    //CGRect titleRect = CGRectMake(0, 0, 300, 40);
//    //UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
//    //tableTitle.textColor = [UIColor blackColor];
//    //tableTitle.backgroundColor = [tableView backgroundColor];
//    //tableTitle.opaque = YES;
//    //tableTitle.font = [UIFont boldSystemFontOfSize:12];
//    //tableTitle.textAlignment=NSTextAlignmentCenter;
//    //tableTitle.text = @"Customer Information";
//    //tableView.tableHeaderView = tableTitle;
//    //[self drawRect:titleRect];
//    //
//    
//    // important! without this line it does not work!
//    [tableView setBackgroundView:[[UIView alloc] init]];
//    // set plain background color
//    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
//    // remove seperator color
//    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    //[tableView setSeparatorColor:[UIColor blackColor]];
//    
//    // add to canvas
//    [self.view addSubview:tableView];
//    
//    
//    
//    accountName=[NSArray arrayWithObjects:@"Current Account",@"Savings Account",@"eSaver Account",nil];
//    accountNumber=[NSArray arrayWithObjects:@"123456789",@"757575757575",@"9947474747",nil];
//    accountCurrency=[NSArray arrayWithObjects:@"AED",@"USD",@"INR",nil];
//    accountAvlBalance=[NSArray arrayWithObjects:@"100,273.56",@"46,576.12",@"5,466.88",nil];
//    accountCurrentBalance=[NSArray arrayWithObjects:@"46,474.67",@"477,575.34",@"585,464.57",nil];
//    accountStatus=[NSArray arrayWithObjects:@"Active",@"Dormant",@"Active",nil];
//        
    
 
    




/*- (void)loadView
 {
 UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 250.0f, 30.0f) style:UITableViewStylePlain];
 //tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
 tableView.delegate = self;
 tableView.dataSource = self;
 [tableView reloadData];
 //self.view = tableView;
 [self.view addSubview:tableView];
 }*/

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    return [accountName count];
//    //return [customerInfo.count count];
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Number of rows is the number of time zones in the region for the specified section.
//    //Region *region = [regions objectAtIndex:section];
//    //return [region.timeZoneWrappers count];
//   
//    return [accountName count];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //GFloat result;
//    //switch ([indexPath row])
//    //{
//    //    case 0: {
//    //        result = kUIRowHeight;
//    //        break; }
//    //    case 1: {
//    //        result = kUIRowLabelHeight;
//    //        break; }
//    //}
//    return 50;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    // The header for the section is the region name -- get this from the region at the section index.
//    //Region *region = [regions objectAtIndex:section];
//    //return [region name];
//    
//    
//    if(section == 0)
//        
//        return @"Accounts";
//    
//    else
//        
//        return @"Credit Card";
//    
//    //return nil;
//}
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    /*if ((indexPath.row % 2) == 1) {
//        cell.backgroundColor = [UIColor grayColor];
//        //cell.textLabel.backgroundColor = [UIColor blackColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor whiteColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//    }*/
//    
//    cell.backgroundColor=[UIColor whiteColor];
//    cell.layer.cornerRadius=10.0f;
//    cell.layer.borderWidth=2.0f;
//    cell.layer.shadowRadius=3.0f;
//    
//    
//    //UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
//    //CALayer *sublayerHeader = [CALayer layer];
//    //sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
//    //sublayerHeader.shadowOffset = CGSizeMake(0, 3);
//    //sublayerHeader.shadowRadius = 10.0;
//    //sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
//    //sublayerHeader.shadowOpacity = 0.8;
//    //sublayerHeader.cornerRadius = 10.0;
//    //sublayerHeader.frame = CGRectMake(0, 0, tableView.bounds.size
//                                    //  .width, tableView.bounds.size.height);
//    //[shadowView.layer addSublayer:sublayerHeader];
//    //[self.view.layer addSublayer:sublayerHeader];
//    //[cell.contentView addSubview:shadowView];
//    
//    //[cell.layer addSublayer:sublayerHeader];
//    
//    
//    
//    /*cell.contentView.layer.cornerRadius = 15.0f;
//    cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
//    cell.contentView.layer.borderWidth = 1.0f;*/
//    
//}
//
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 3;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *MyIdentifier = @"MyReuseIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
//        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle=UITableViewCellSelectionStyleNone;
//        
//        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
//    }
//    
//    
//    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
//    
//    UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 14.0 ];
//    cell.textLabel.font  = myFont;
//    UIFont *mySecondFont = [ UIFont fontWithName: @"Arial" size: 10.0 ];
//    cell.detailTextLabel.font  = mySecondFont;
//    
//    
//    //top shadow
//    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
//    //CAGradientLayer *topShadow = [CAGradientLayer layer];
//    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
//    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
//    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
//    
//    //[cell.contentView addSubview:topShadowView];
//    
//
//    
//    
//    NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
//    
//    
//    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@  %@",[self.accountCurrency objectAtIndex:indexPath.row],[self.accountNumber objectAtIndex:indexPath.row]];
//    
//    
//
//    
//    
//    return cell;
//}

//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    //if ([[segue identifier] isEqualToString:@"ACSumSegue"])
//    //{
////        AccountSumViewController *accountSumViewController = [segue destinationViewController];
////        accountSumViewController.userid=(NSString *) self.userid;
////        accountSumViewController.sessionid=(NSString *) self.sessionid;
//    
//        
//    //}
//}



-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}

-(void) logout:(id) sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}

@end