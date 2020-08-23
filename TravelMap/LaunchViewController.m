//
//  LaunchViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/15/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import "LaunchViewController.h"
#import "LoginViewController.h"
#import "SearchViewController.h"
#import "DashboardViewController.h"
#import "AccountSumViewController.h"
#import "CCSumViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

@synthesize txtUserid;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
    self.view.backgroundColor=[UIColor whiteColor];
    

    
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
    
    
    
    //--------tab bar
    
//    
//    self.tabBar=[[UITabBarController alloc]init];
//    
//    // FirstViewController
//    LoginViewController *loginViewController=[[LoginViewController alloc]initWithNibName:nil bundle:nil];
//    loginViewController.title=@"Login";
//    loginViewController.tabBarItem.image=[[UIImage imageNamed:@"Money-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    // FirstViewController
//    DashboardViewController *dashboardViewController=[[DashboardViewController alloc]initWithNibName:nil bundle:nil];
//    dashboardViewController.title=@"Dashboard";
//    dashboardViewController.tabBarItem.image=[[UIImage imageNamed:@"Money-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    // FirstViewController
//    AccountSumViewController *accountSumViewController=[[AccountSumViewController alloc]initWithNibName:nil bundle:nil];
//    accountSumViewController.title=@"Accounts";
//    accountSumViewController.tabBarItem.image=[[UIImage imageNamed:@"money-wallet-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    //SecondViewController
//    CCSumViewController *ccSumViewController=[[CCSumViewController alloc]initWithNibName:nil bundle:nil];
//    ccSumViewController.title=@"Credit Card";
//    ccSumViewController.tabBarItem.image=[[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    
//    // FirstViewController
//    AccountSumViewController *accountSumViewController1=[[AccountSumViewController alloc]initWithNibName:nil bundle:nil];
//    accountSumViewController1.title=@"Desposits";
//    accountSumViewController1.tabBarItem.image=[[UIImage imageNamed:@"money-wallet-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    //SecondViewController
//    CCSumViewController *ccSumViewController1=[[CCSumViewController alloc]initWithNibName:nil bundle:nil];
//    ccSumViewController1.title=@"ATM";
//    ccSumViewController1.tabBarItem.image=[[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    // FirstViewController
//    AccountSumViewController *accountSumViewController2=[[AccountSumViewController alloc]initWithNibName:nil bundle:nil];
//    accountSumViewController2.title=@"Branch";
//    accountSumViewController2.tabBarItem.image=[[UIImage imageNamed:@"money-wallet-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    //SecondViewController
//    CCSumViewController *ccSumViewController2=[[CCSumViewController alloc]initWithNibName:nil bundle:nil];
//    ccSumViewController2.title=@"Services";
//    ccSumViewController2.tabBarItem.image=[[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    
//    self.tabBar.viewControllers=[NSArray arrayWithObjects:loginViewController, dashboardViewController,accountSumViewController, ccSumViewController,accountSumViewController1,ccSumViewController1,accountSumViewController2,ccSumViewController2,  nil];
//    
//    
//    
//    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", numberOfNewItems];
//    //self.tabBar.selectedIndex=0;
//    
//    [self.view addSubview:self.tabBar.view];
//    
    
    
    
    
    
    //-------
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) logout:(id) sender
{
    return;
}


//
//- (IBAction)btnLogin:(id)sender {
//    
//    
//    DashboardViewController *dashboardViewController = [[DashboardViewController alloc] initWithNibName:nil bundle:nil];
//    
//    // Configure the RecipeAddViewController. In this case, it reports any
//    // changes to a custom delegate object.
//    //dashboardViewController
//    
//    // Create the navigation controller and present it.
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:dashboardViewController];
//    [self presentViewController:navigationController animated:YES completion: nil];
//}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"LoginSegue"])
//    {
//        SearchViewController *searchViewController = [segue destinationViewController];
//        searchViewController.userid=(NSString *) self.txtUserid.text;
//        
//    }
//}



@end

