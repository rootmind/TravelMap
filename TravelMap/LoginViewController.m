//
//  ViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/1/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import "LoginViewController.h"
//#import "SearchViewController.h"

#import "DashboardViewController.h"
//#import "AccountSumViewController.h"
//#import "CCSumViewController.h"
//#import "LaunchViewController.h"
#import "ScrollViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"


//static NSString *kNameKey = @"nameKey";
//static NSString *kImageKey = @"imageKey";


@interface LoginViewController ()

//@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) UIPageControl *pageControl;
//@property (nonatomic, strong) NSMutableArray *viewControllers;

@end

#pragma mark -

#define IMAGE_WIDTH 320

#define IMAGE_HEIGHT 360


@implementation LoginViewController

@synthesize lblUserid;
@synthesize lblPassword;
@synthesize txtUserid;
@synthesize txtPassword;
@synthesize btnLogin;
@synthesize lblMessage;

@synthesize scrollView;
@synthesize pageControl;
@synthesize indexNumber;
//@synthesize lblScroll;
@synthesize  pageControlBeingUsed;
@synthesize pageImage;

@synthesize userid;
@synthesize sessionid;
@synthesize dataDictionary;
@synthesize lastLoginDate;
@synthesize deviceToken;

@synthesize activityIndicator;

NSUInteger numberOfImages=3;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
   
     NSLog(@"hostServerURL %@",[self ReadSingleTonInstanceVariable:@"hostServerURL"]);
    
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
//    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
//    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];//@"Mashreq_logo.png"];
//    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
//    companyLogo.clipsToBounds = NO;
//    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    //self.navigationItem.titleView=companyLogo;
    
    //self.navigationController.navigationBar.barStyle=UIBarStyleBlackTranslucent;
    
    
    //self.navigationController.navigationBar.translucent = NO;
    
//    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
//    {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
 
//    // load our data from a plist file inside our app bundle
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"content_iPhone" ofType:@"plist"];
//    self.contentList = [NSArray arrayWithContentsOfFile:path];

    

    //lblUserid = [[UILabel alloc] initWithFrame:CGRectMake(40, 105, 100, 20)];
    lblUserid = [[UILabel alloc] init]; //]WithFrame:CGRectMake(40, 105, 100, 20)];
    //lblUserid.borderStyle = UITextBorderStyleRoundedRect;
    lblUserid.font = [UIFont systemFontOfSize:18];
    lblUserid.text=@"User id";
    lblPassword.contentMode=UIControlContentHorizontalAlignmentLeft;
    //lblUserid.placeholder = @"Enter userid";
    //lblUserid.autocorrectionType = UITextAutocorrectionTypeNo;
    //lblUserid.keyboardType = UIKeyboardTypeDefault;
    //lblUserid.returnKeyType = UIReturnKeyDone;
    //lblUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
    //lblUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtUserid.delegate = self;
    lblUserid.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblUserid];
    
    

    
//    NSLog(@" frame x %f",self.view.frame.origin.x);
//    
//    NSLog(@" frame y %f",self.view.frame.origin.y);
//     NSLog(@" frame x %f",self.view.frame.size.width);
//     NSLog(@" frame x %f",self.view.frame.size.height);
    
    lblPassword = [[UILabel alloc] init];  //WithFrame:CGRectMake(40, 145, 100, 20)];
    //lblUserid.borderStyle = UITextBorderStyleRoundedRect;
    lblPassword.font = [UIFont systemFontOfSize:18];
    lblPassword.text=@"Password";
    lblPassword.contentMode=UIControlContentHorizontalAlignmentLeft;
    //lblUserid.placeholder = @"Enter userid";
    //lblUserid.autocorrectionType = UITextAutocorrectionTypeNo;
    //lblUserid.keyboardType = UIKeyboardTypeDefault;
    //lblUserid.returnKeyType = UIReturnKeyDone;
    //lblUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
    //lblUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtUserid.delegate = self;
    lblPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblPassword];
 

    

//    
//    [self.view setNeedsUpdateConstraints];
    
    //NSLog(@" frame x1 %f",self.lblUserid.frame.origin.x);
    //NSLog(@" frame y1 %f",self.lblUserid.frame.origin.y);
    
    
    
    txtUserid = [[UITextField alloc] init];//]WithFrame:CGRectMake(120, 100, 100, 30)];
    txtUserid.borderStyle = UITextBorderStyleRoundedRect;
    txtUserid.layer.borderWidth=1.0;
    txtUserid.layer.borderColor=[UIColor blackColor].CGColor;
    txtUserid.layer.cornerRadius=5.0;
    txtUserid.font = [UIFont systemFontOfSize:18];
    txtUserid.placeholder = @"Enter userid";
    txtUserid.autocorrectionType = UITextAutocorrectionTypeNo;
    txtUserid.keyboardType = UIKeyboardTypeDefault;
    txtUserid.returnKeyType = UIReturnKeyDone;
    txtUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtUserid.delegate = self;
    txtUserid.text=@"saikiran";
    txtUserid.delegate=self;
    txtUserid.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtUserid];
    
    txtPassword = [[UITextField alloc] init]; //WithFrame:CGRectMake(120, 140, 100, 30)];
    txtPassword.borderStyle = UITextBorderStyleRoundedRect;
    txtPassword.layer.borderWidth=1.0;
    txtPassword.layer.borderColor=[UIColor blackColor].CGColor;
    txtPassword.layer.cornerRadius=5.0;
    txtPassword.font = [UIFont systemFontOfSize:18];
    txtPassword.placeholder = @"Enter password";
    txtPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPassword.keyboardType = UIKeyboardTypeDefault;
    txtPassword.returnKeyType = UIReturnKeyDone;
    txtPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtPassword.delegate = self;
    //txtPassword.text=@"1";
    [txtPassword setSecureTextEntry:YES];
    txtPassword.delegate=self;
    txtPassword.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtPassword];
    
 
    
    
//    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(lblUserid, lblPassword,txtUserid,txtPassword);
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-105-[lblUserid]-25-[lblPassword]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
//
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[txtUserid]-10-[txtPassword]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
//
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[lblUserid(>=70)]-[txtUserid]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];
//
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[lblPassword(>=70)]-[txtPassword]" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:viewsDictionary]];

 
    
    
    
    btnLogin = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    //btnLogin.titleLabel.text=@"Login";
    //[btnLogin setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnLogin.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnLogin.layer.borderColor=[UIColor grayColor].CGColor;
    btnLogin.layer.borderWidth=1.0f;
    [btnLogin setBackgroundColor:[UIColor whiteColor]];
    [btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //btnLogin.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnLogin.titleLabel.font = [UIFont systemFontOfSize:18];
    btnLogin.layer.cornerRadius=5.0f;
    //btnLogin.layer.masksToBounds=YES;
    //btnLogin.clipsToBounds=YES;
    [btnLogin addTarget:self action:@selector(btnLogin:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnLogin];

    
    lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(40, 240, 300, 20)];
    //lblUserid.borderStyle = UITextBorderStyleRoundedRect;
    lblMessage.font = [UIFont systemFontOfSize:14];
    //lblMessage.text=@"User id";
    lblMessage.contentMode=UIControlContentHorizontalAlignmentLeft;
    //lblUserid.placeholder = @"Enter userid";
    //lblUserid.autocorrectionType = UITextAutocorrectionTypeNo;
    //lblUserid.keyboardType = UIKeyboardTypeDefault;
    //lblUserid.returnKeyType = UIReturnKeyDone;
    //lblUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
    //lblUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtUserid.delegate = self;
    [self.view addSubview:lblMessage];

    
//    //-----Apple Code
//    
//    NSUInteger numberPages = self.contentList.count;
//    
//    // view controllers are created lazily
//    // in the meantime, load the array with placeholders which will be replaced on demand
//    NSMutableArray *controllers = [[NSMutableArray alloc] init];
//    for (NSUInteger i = 0; i < numberPages; i++)
//    {
//        [controllers addObject:[NSNull null]];
//    }
//    self.viewControllers = controllers;
//    
//    // a page is the width of the scroll view
//    self.scrollView = [[UIScrollView alloc] init];
//    self.scrollView.pagingEnabled = YES;
//    self.scrollView.contentSize =
//    CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numberPages, CGRectGetHeight(self.scrollView.frame));
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//    self.scrollView.showsVerticalScrollIndicator = NO;
//    self.scrollView.scrollsToTop = NO;
//    self.scrollView.delegate = self;
//    self.scrollView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:self.scrollView];
//    
//    self.pageControl = [[UIPageControl alloc] init] ;
//    self.pageControl.numberOfPages = numberPages;
//    self.pageControl.currentPage = 0;
//    self.pageControl.pageIndicatorTintColor=[UIColor lightGrayColor];
//    self.pageControl.currentPageIndicatorTintColor=[UIColor blueColor];
//    self.pageControl.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:self.pageControl];
//    
//
//    
//
// 
//    
//    //---------Apple Code

    
    
//    DashboardViewController  *dashboardViewController = [[DashboardViewController alloc] init];
//    AccountSumViewController  *accountSumViewController = [[AccountSumViewController alloc] init];
//    CCSumViewController  *ccSumViewController = [[CCSumViewController alloc] init];
//    
//    
//    NSArray * viewControllers = [NSArray arrayWithObjects:dashboardViewController, accountSumViewController,ccSumViewController, nil];
//    
//    // Create the nav controller and set the view controllers.
//    UINavigationController*  theNavController = [[UINavigationController alloc]
//                                                 initWithRootViewController:dashboardViewController];
//    [theNavController setViewControllers:viewControllers animated:NO];
//    
//    // Display the nav controller modally.
//    [self presentModalViewController:theNavController animated:YES];
    

    

    
    
 //-----scroll comment---
//    //CGRect scrollViewFrame = CGRectMake(20, 260, 280, 220);
//    //self.scrollView = [[UIScrollView alloc] init];//WithFrame:scrollViewFrame];
//    self.scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    self.scrollView.delegate = self;
//    self.scrollView.tag=1;
//    self.scrollView.autoresizingMask=UIViewAutoresizingNone;
//    scrollView.backgroundColor=[UIColor redColor];
//    scrollView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:self.scrollView];
//    self.pageControlBeingUsed=NO;
//    [self.scrollView setPagingEnabled:YES];
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//    self.scrollView.showsVerticalScrollIndicator = NO;
//    self.scrollView.scrollsToTop = NO;
//    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numberOfImages, CGRectGetHeight(self.scrollView.frame));
//    [self setupScrollView:self.scrollView];
//    
//
//    
//    
//    //self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 264, 480, 36)];
//    self.pageControl = [[UIPageControl alloc] init] ;
//    //self.pageControl.frame = CGRectMake(0, 264, 480, 36);
//    [self.pageControl setTag:12];
//    self.pageControl.numberOfPages = numberOfImages;
//    self.pageControl.currentPage = 0;
//    self.pageControl.pageIndicatorTintColor=[UIColor grayColor];
//    self.pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];//[UIColor blueColor];
//    self.pageControl.autoresizingMask=UIViewAutoresizingNone;
//    self.pageControl.translatesAutoresizingMaskIntoConstraints=NO;
//    self.pageControl.backgroundColor = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
//    [self.view addSubview:self.pageControl];
//-------scroll comment--
    
    
//    CGSize scrollViewContentSize = CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height);//CGSizeMake(640, 404);
//    //
//    
//    
//
    //[self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:YES];
    
    //CGFloat topInset = (self.frame.size.height - self.contentView.frame.size.height)/2;
    //self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //lblScroll  = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 50, 21)];
    //[lblScroll setText:@"Hello"];
    //[self.scrollView addSubview:lblScroll];
    
    
    //Full screen width
    UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.width/1.5)];
    //UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/8, self.view.frame.size.height/2, self.view.frame.size.width/1.35, self.view.frame.size.width/2)];
    scr.tag = 1;
    scr.autoresizingMask=UIViewAutoresizingNone;
    //scr.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:scr];
    [self setupScrollView:scr];
    UIPageControl *pgCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 264, self.view.frame.size.width, self.view.frame.size.width/1.5)];
    [pgCtr setTag:12];
    pgCtr.numberOfPages=3;
    pgCtr.autoresizingMask=UIViewAutoresizingNone;
    pgCtr.pageIndicatorTintColor=[UIColor blueColor];
    pgCtr.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:pgCtr];
    
    
    
    //------userid
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblUserid attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblUserid attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-110]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//    
    //-------password
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:-110]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    //-----login button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLogin attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
//    //-------scroll
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0]];
//    //------page control
//    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];



    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
//    [self loadScrollViewWithPage:0];
//    [self loadScrollViewWithPage:1];
    
    
    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scr attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0]];
        //------page control
    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.7 constant:0]];
//    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
//    
//        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pageControl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];


}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtUserid) {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == self.txtPassword) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}




//- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//{
//    // remove all the subviews from our scrollview
//    for (UIView *view in self.scrollView.subviews)
//    {
//        [view removeFromSuperview];
//    }
//    
//    NSUInteger numPages = self.contentList.count;
//    
//    // adjust the contentSize (larger or smaller) depending on the orientation
//    self.scrollView.contentSize =
//    CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numPages, CGRectGetHeight(self.scrollView.frame));
//    
//    // clear out and reload our pages
//    self.viewControllers = nil;
//    NSMutableArray *controllers = [[NSMutableArray alloc] init];
//    for (NSUInteger i = 0; i < numPages; i++)
//    {
//        [controllers addObject:[NSNull null]];
//    }
//    self.viewControllers = controllers;
//    
//    [self loadScrollViewWithPage:self.pageControl.currentPage - 1];
//    [self loadScrollViewWithPage:self.pageControl.currentPage];
//    [self loadScrollViewWithPage:self.pageControl.currentPage + 1];
//    [self gotoPage:NO]; // remain at the same page (don't animate)
//}
//
//- (void)loadScrollViewWithPage:(NSUInteger)page
//{
//    NSLog(@"page :%ld",page);
//    NSLog(@"count :%ld",self.contentList.count);
//    
//    if (page >= self.contentList.count)
//        return;
//    
//    // replace the placeholder if necessary
//    ScrollViewController *controller = [self.viewControllers objectAtIndex:page];
//    if ((NSNull *)controller == [NSNull null])
//    {
//        controller = [[ScrollViewController alloc] initWithPageNumber:page];
//        [self.viewControllers replaceObjectAtIndex:page withObject:controller];
//    }
//    
//    // add the controller's view to the scroll view
//    //if (controller.view.superview == nil)
//    //{
//        CGRect frame = self.scrollView.frame;
//        frame.origin.x = CGRectGetWidth(frame) * page;
//        frame.origin.y = 0;
//        controller.view.frame = frame;
//        
//        [self addChildViewController:controller];
//        [self.scrollView addSubview:controller.view];
//        [controller didMoveToParentViewController:self];
//        
//        NSDictionary *numberItem = [self.contentList objectAtIndex:page];
//        controller.numberImage.image = [UIImage imageNamed:[numberItem valueForKey:kImageKey]];
//        //controller.numberTitle.text = [numberItem valueForKey:kNameKey];
//    //}
//}
//
//// at the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    // switch the indicator when more than 50% of the previous/next page is visible
//    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
//    NSUInteger page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.pageControl.currentPage = page;
//    
//    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
//    [self loadScrollViewWithPage:page - 1];
//    [self loadScrollViewWithPage:page];
//    [self loadScrollViewWithPage:page + 1];
//    
//    // a possible optimization would be to unload the views+controllers which are no longer visible
//}
//
//- (void)gotoPage:(BOOL)animated
//{
//    NSInteger page = self.pageControl.currentPage;
//    
//    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
//    [self loadScrollViewWithPage:page - 1];
//    [self loadScrollViewWithPage:page];
//    [self loadScrollViewWithPage:page + 1];
//    
//    // update the scroll view to the appropriate page
//    CGRect bounds = self.scrollView.bounds;
//    bounds.origin.x = CGRectGetWidth(bounds) * page;
//    bounds.origin.y = 0;
//    [self.scrollView scrollRectToVisible:bounds animated:animated];
//}
//
//- (void)changePage:(id)sender
//{
//    [self gotoPage:YES];    // YES = animate
//}


- (void)setupScrollView:(UIScrollView*)scrMain {
    // we have 10 images here.
    // we will add all images into a scrollView &amp; set the appropriate size.
    
    for (int i=1; i<=3; i++) {
        // create image
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"mobile_banking%d.png",i]];
        // create imageView
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];
        // set scale to fill
        imgV.contentMode=UIViewContentModeScaleToFill;
        // set image
        [imgV setImage:image];
        // apply tag to access in future
        imgV.tag=i+1;
        // add to scrollView
        [scrMain addSubview:imgV];
    }
    // set the content size to 10 image width
    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width*3, scrMain.frame.size.height)];
    // enable timer after each 2 seconds for scrolling.
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
}

- (void)scrollingTimer {
    // access the scroll view with the tag
    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
    // same way, access pagecontroll access
    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
    // get the current offset ( which page is being displayed )
    CGFloat contentOffset = scrMain.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;
    // if page is not 10, display it
    if( nextPage!=3 )  {
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
        // else start sliding form 1 :)
    } else {
        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=0;
    }
}


//- (void)setupScrollView:(UIScrollView*)scrMain {
//    // we have 10 images here.
//    // we will add all images into a scrollView &amp; set the appropriate size.
//    
//    
//    
//    for (int i=1; i<=numberOfImages; i++) {
//        
//        //NSLog(@" i.. %i",i);
//
//        pageImage = [UIImage imageNamed:[NSString stringWithFormat:@"mobile_banking%d.png",i]];//imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//        
//        //         create imageView
//        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];
//        
//        
//        
//        //UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        
//        
//        //NSLog(@" image set.. %f",scrMain.frame.size.width);
//        
//        // set scale to fill
//        imgV.contentMode=UIViewContentModeScaleToFill;
//        
//    
//        // set image
//        [imgV setImage:pageImage];
//        // apply tag to access in future
//        imgV.tag=i+1;
//        
//        //imgV.translatesAutoresizingMaskIntoConstraints=NO;
//        scrMain.translatesAutoresizingMaskIntoConstraints=NO;
//        
//
//        
//        
//        // add to scrollView
//        [scrMain addSubview:imgV];
//        
//        
////                [scrMain addConstraint:[NSLayoutConstraint constraintWithItem:imgV attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:scrMain attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
////        
////                [scrMain addConstraint:[NSLayoutConstraint constraintWithItem:imgV attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:scrMain attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
////        
////                [scrMain addConstraint:[NSLayoutConstraint constraintWithItem:imgV attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:scrMain attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
////        
////                [scrMain addConstraint:[NSLayoutConstraint constraintWithItem:imgV attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:scrMain attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//        
//        
//    }
//    
//    
//    
//    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width*numberOfImages, scrMain.frame.size.height)];
//    
//
//    // enable timer after each 2 seconds for scrolling.
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
//    
//
//}




//- (void)scrollingTimer {
//    // access the scroll view with the tag
//    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
//    // same way, access pagecontroll access
//    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
//    // get the current offset ( which page is being displayed )
//    CGFloat contentOffset = scrMain.contentOffset.x;
//    //NSLog(@" con %f",contentOffset);
//    // calculate next page to display
//    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;
//    
//    
//    
//    // if page is not 10, display it
//    if( nextPage!=numberOfImages)  {
//        //NSLog(@" nfirst if..... %f",scrMain.frame.size.width);
//        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
//        pgCtr.currentPage=nextPage;
//        // else start sliding form 1 :)
//    } else {
//        //NSLog(@" second if.... %i",nextPage);
//        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
//        pgCtr.currentPage=0;
//    }
//    
//    
//    
//}



- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
 
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    pageControlBeingUsed = NO;
//}




//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat pageWidth = self.scrollView.frame.size.width;
//    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
//    NSInteger page = lround(fractionalPage);
//    self.pageControl.currentPage = page;
//}


//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    //self.lblScroll.text = [NSString stringWithFormat:@"%d",indexNumber];
//}



//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    
//    //self.lblScroll.text = [NSStringstringWithFormat:@"Screen #%d", self.indexNumber];
//    NSLog(@"view did appear");
//}


- (void) validateUser  {
    
    
    @try {
        
        
        
        NSLog(@"validate user %@",userid);
        
        
        
        //        //main thread
        //        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        //        [self.view addSubview:spinner];
        //
        //        //switch to background thread
        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        //
        //            //back to the main thread for the UI call
        //            dispatch_async(dispatch_get_main_queue(), ^{
        //                [spinner startAnimating];
        //            });
        
        
        deviceToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
        
        NSLog(@"Device Token in login %@",deviceToken);
        
       
        
        
        //string for the URL request
        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/AccountsServlet";
        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];
        NSLog(@"Host Server URL %@", myUrlString);
        //create string for parameters that we need to send in the HTTP POST body
        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&deviceToken=%@&methodAction=validateUser",userid,sessionid,deviceToken];
        
        
        //create a NSURL object from the string data
        NSURL *myUrl = [NSURL URLWithString:myUrlString];
        
        //create a mutable HTTP request
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
        //sets the receiver’s timeout interval, in seconds
        [urlRequest setTimeoutInterval:30.0f];
        //sets the receiver’s HTTP request method
        [urlRequest setHTTPMethod:@"POST"];
        //sets the request body of the receiver to the specified data.
        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
        
//        NSString *post = [NSString stringWithFormat:@"test=Message&this=isNotReal"];
//        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
//        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        [request setHTTPBody:postData];
        
        
        
        //allocate a new operation queue
        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //Loads the data for a URL request and executes a handler block on an
        //operation queue when the request completes or fails.
        /*[NSURLConnection
         sendAsynchronousRequest:urlRequest
         queue:queue
         completionHandler:^(NSURLResponse *response,
         NSData *data,
         NSError *error) {
         if ([data length] >0 && error == nil){
         //process the JSON response
         //use the main queue so that we can interact with the screen
         dispatch_async(dispatch_get_main_queue(), ^{
         [self parseResponse:data];
         });
         }
         else if ([data length] == 0 && error == nil){
         NSLog(@"Empty Response, not sure why?");
         }
         else if (error != nil){
         NSLog(@"Not again, what is the error = %@", error);
         }
         }];*/
        
        
        NSURLResponse *response = nil;
        NSError *error = nil;
        //getting the data
        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
        if ([newData length] >0 && error == nil){
            //process the JSON response
            //use the main queue so that we can interact with the screen
            
            [self parseResponse:newData];
            
        }
        else if ([newData length] == 0 && error == nil){
            NSLog(@"Empty Response, not sure why?");
        }
        else if (error != nil){
            NSLog(@"Not again, what is the error = %@", error);
            
            [self displayMessage:error];
            
        }
        
        
        
        
        
        
        
        //
        //            //back to the main thread for the UI call
        //            dispatch_async(dispatch_get_main_queue(), ^{
        //                [spinner stopAnimating];
        //            });
        //            });
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in validate user code %@ reason %@ " , [exception name], [exception reason]);
    }
    @finally {
        
        NSLog(@"finally in fetch validate user");
    }
    
    
}


- (void) parseResponse:(NSData *) data {
    
    
    @try {
        
        
        
        NSLog(@"get validate user %@",userid);
        
        
        
        NSString *myData = [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];
        NSLog(@"JSON data = %@", myData);
        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:@"validateUser"];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                

                
                // Get an array of dictionaries with the key "locations"
                lastLoginDate = [dataDictionary objectForKey:@"lastLoginDate"];
                
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    accounts = [[AccountsData alloc] initWithJSONDictionary:dict];
//                    NSLog(@" accounts %@",accounts.accountNumber);
//                    
//                    // Add the Location object to the array
//                    [accountsArray addObject:accounts];
//                }
//                
                
                NSLog(@"last login date %@",lastLoginDate);
                
                
                
                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
                //
                //                for(NSString *key in [customerMasterData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"Customer number"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"accountsWrapper"];
                
                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
                
                
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
                //
                //                }
                
                
                //                accountName = [customerDetailData objectForKey:@"customerName"];
                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
                //                accountStatus= [customerDetailData objectForKey:@"accountStatus"];
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"accountNumber"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
                //                accountsKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                //                accountsValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                
                
                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                //                for (NSString *string in accountsKeyData) {
                //                    NSLog(@" array key data:%@", string);
                //                }
                //
                //                for (NSString *string in accountsValueData) {
                //                    NSLog(@" array value data:%@", string);
                //                }
                
                //for (NSDictionary *info in [customerInfo allValues])
                //{
                //   [custData addObject:[info valueForKey:@"custName"]];
                //}
                
                //NSArray * values = [dictionary allValues];
                //NSArray *keys = [dictionary allKeys];
                //NSArray *values = [dictionary allValues];
                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //    [yourArray addObject:obj];
                //}];
                
                
            }
            else {
                NSLog(@"Customer Code is Invalid...");
            }
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}

-(void) displayMessage:(NSError *) error{
    
    UIAlertController * alertController=   [UIAlertController
                                            alertControllerWithTitle:@"message"
                                            message:@"Invalid userid or password"
                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Do some thing here
                                   //[self.navigationController popViewControllerAnimated:YES];
                                   
                               }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}


-(void)loadView {
    [super loadView];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    //[self.activityIndicator setHidesWhenStopped:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


- (IBAction)btnLogin:(id)sender {
    
    NSLog(@"button clicked");
    
      [self.activityIndicator startAnimating];
    
    
    self.userid=txtUserid.text;
    
    //trim spaces
    userid = [userid stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([userid length] <= 0 || userid == nil || [userid  isEqual:@""] == TRUE)
    {
        self.lblMessage.text =@"Enter userid and password";
    }
    else{
        
        self.lblMessage.text =@"";

        self.userid=txtUserid.text;

        
        [self validateUser];
        
        DashboardViewController *dashboardViewController = [[DashboardViewController alloc]initWithNibName:nil bundle:nil];
        dashboardViewController.userid=self.userid;
        dashboardViewController.sessionid=self.sessionid;
        dashboardViewController.lastLoginDate=lastLoginDate;
        [self.navigationController pushViewController:dashboardViewController animated:YES];
        
    }
    
    [self.activityIndicator stopAnimating];
    
 
    

//    

    
    // Configure the new view controller here.
    
    //[self presentViewController:dashboardViewController animated:YES completion:nil];

    
    
//    DashboardViewController *dashboardViewController = [[DashboardViewController alloc]initWithNibName:nil bundle:nil];
//    //[self presentViewController:hello animated:YES completion:nil];
//    [self.view.window.rootViewController presentViewController:dashboardViewController animated:YES completion:nil];
//    
//    DashboardViewController *dashboardViewController = [[DashboardViewController alloc] init];//]WithNibName:nil bundle:nil];
//    
// 
//    
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:dashboardViewController];
//    [self presentViewController:navigationController animated:YES completion: nil];
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    //if ([[segue identifier] isEqualToString:@"LoginSegue"])
//    //{
//     //   SearchViewController *searchViewController = [segue destinationViewController];
//    //    searchViewController.userid=(NSString *) self.txtUserid.text;
//
//    //}
//    
//        DashboardViewController *dashboardViewController = [segue destinationViewController];
//        dashboardViewController.userid=(NSString *) self.txtUserid.text;
//}

//- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
//    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//
//    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
//    
//    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
//}

// to deal with self-signed certificates
- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod
            isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod
         isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        // we only trust our own domain
        if ([challenge.protectionSpace.host isEqualToString:@"192.168.2.8"])
        {
            NSURLCredential *credential =
            [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        }
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}


@end
