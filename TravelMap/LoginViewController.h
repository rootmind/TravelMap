//
//  ViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/1/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblUserid;
@property (strong, nonatomic) IBOutlet UILabel *lblPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtUserid;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UILabel *lblMessage;

@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSString *lastLoginDate;
@property (strong, nonatomic) NSString *deviceToken;



- (IBAction)btnLogin:(id)sender;


//@property (nonatomic, retain) UITabBarController *tabBar;


@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl * pageControl;
@property (assign, nonatomic) NSInteger *indexNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblScroll;
@property (nonatomic) BOOL pageControlBeingUsed;
@property (nonatomic, strong) UIImage *pageImage;

@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;

//@property (nonatomic, strong) NSArray *contentList;

- (void)setupScrollView:(UIScrollView*)scrMain ;

@end

