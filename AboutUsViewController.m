//
//  AboutUsViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 12/27/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AboutUsViewController.h"
#import "UIColor+Constants.h"
#import "SingletonClass.h"

@interface AboutUsViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

@implementation AboutUsViewController




@synthesize btnContactUs;
@synthesize btnWebsite;
@synthesize btnPortForward;
@synthesize switchPortForward;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    
    
    
    
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
    
    //self.navigationItem.titleView=companyLogo;
    
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
    //    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
    //    //companyLogo.contentMode=UIViewContentModeCenter;
    //    companyLogo.contentMode = UIViewContentModeScaleToFill;
    //    companyLogo.clipsToBounds = NO;
    //    //[self.view addSubview:companyLogo];
    //
    //    //self.navigationItem.titleView=companyLogo;
    
    
    
    //    CALayer *sublayerHeader = [CALayer layer];
    //    sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
    //    sublayerHeader.shadowOffset = CGSizeMake(0, 3);
    //    sublayerHeader.shadowRadius = 10.0;
    //    sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
    //    sublayerHeader.shadowOpacity = 0.8;
    //    sublayerHeader.cornerRadius = 30.0;
    //    //sublayerHeader.frame = CGRectMake(30, 80, 270, 100);
    //    sublayerHeader.bounds=headerView.bounds;
    //    [self.view.layer addSublayer:sublayerHeader];
    
    
    
    
    
    btnContactUs = [[UIButton alloc] init];
    [btnContactUs setTitle:@"Mobility Soft" forState:UIControlStateNormal];
    [btnContactUs.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];//fontWithName:@"Helvetica-Bold" size:12.0]];
    [btnContactUs.titleLabel setTextAlignment: NSTextAlignmentRight];
    [btnContactUs setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnContactUs.layer.borderWidth=1.0;
    btnContactUs.layer.borderColor=[UIColor borderBlueColor].CGColor;
    btnContactUs.layer.shadowRadius=10.0;
    btnContactUs.backgroundColor = [UIColor whiteColor];
    btnContactUs.layer.shadowOffset = CGSizeMake(0, 3);
    btnContactUs.layer.shadowColor = [UIColor blackColor].CGColor;
    btnContactUs.layer.shadowOpacity = 0.8;
    btnContactUs.layer.cornerRadius = 15.0;
    btnContactUs.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //headerView.layer.doubleSided=YES;
    btnContactUs.translatesAutoresizingMaskIntoConstraints=NO;
    [btnContactUs addTarget:self action:@selector(dialCallCenter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnContactUs];
    
    CGRect benRect = CGRectMake(5, 2, 50, 50);
    UIImageView *ben =[[UIImageView alloc] initWithFrame:benRect];
    ben.image=[UIImage imageNamed:@"phone-icon.png"];
    ben.contentMode=UIViewContentModeCenter;
    [btnContactUs addSubview:ben];
    benRect = CGRectMake(5, 7, 80, 80);
    UILabel *benLabel = [[UILabel alloc] initWithFrame:benRect];
    benLabel.text=@"";
    benLabel.textColor=[UIColor captionColor];
    benLabel.font=[UIFont boldSystemFontOfSize:12];
    [btnContactUs addSubview:benLabel];
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnContactUs attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnContactUs attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnContactUs attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.10 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnContactUs attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];
    
    
    
    btnWebsite = [[UIButton alloc] init];
    [btnWebsite setTitle:@"www.google.com" forState:UIControlStateNormal];
    [btnWebsite.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];//fontWithName:@"Helvetica-Bold" size:12.0]];
    [btnWebsite.titleLabel setTextAlignment: NSTextAlignmentRight];
    [btnWebsite setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnWebsite.layer.borderWidth=1.0;
    btnWebsite.layer.borderColor=[UIColor blueColor].CGColor;
    btnWebsite.layer.shadowRadius=10.0;
    btnWebsite.backgroundColor = [UIColor whiteColor];
    btnWebsite.layer.shadowOffset = CGSizeMake(0, 3);
    btnWebsite.layer.shadowColor = [UIColor blackColor].CGColor;
    btnWebsite.layer.shadowOpacity = 0.8;
    btnWebsite.layer.cornerRadius = 15.0;
    btnWebsite.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //headerView.layer.doubleSided=YES;
    btnWebsite.translatesAutoresizingMaskIntoConstraints=NO;
    [btnWebsite addTarget:self action:@selector(dialCallCenter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnWebsite];
    
    CGRect webRect = CGRectMake(5, 2, 50, 50);
    UIImageView *web =[[UIImageView alloc] initWithFrame:webRect];
    web.image=[UIImage imageNamed:@"phone-icon.png"];
    web.contentMode=UIViewContentModeCenter;
    [btnWebsite addSubview:web];
    benRect = CGRectMake(5, 7, 80, 80);
    UILabel *webLabel = [[UILabel alloc] initWithFrame:webRect];
    webLabel.text=@"";
    webLabel.textColor=[UIColor redColor];
    webLabel.font=[UIFont boldSystemFontOfSize:12];
    [btnWebsite addSubview:webLabel];
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnWebsite attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnWebsite attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnWebsite attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.10 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnWebsite attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];
    
    
    
//    btnPortForward = [[UIButton alloc] init];
//    [btnPortForward setTitle:@"Wi-Fi/3G/4G Enabled" forState:UIControlStateNormal];
//    [btnPortForward.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];//fontWithName:@"Helvetica-Bold" size:12.0]];
//    [btnPortForward.titleLabel setTextAlignment: NSTextAlignmentRight];
//    [btnPortForward setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btnPortForward.layer.borderWidth=1.0;
//    btnPortForward.layer.borderColor=[UIColor blueColor].CGColor;
//    btnPortForward.layer.shadowRadius=10.0;
//    btnPortForward.backgroundColor = [UIColor whiteColor];
//    btnPortForward.layer.shadowOffset = CGSizeMake(0, 3);
//    btnPortForward.layer.shadowColor = [UIColor blackColor].CGColor;
//    btnPortForward.layer.shadowOpacity = 0.8;
//    btnPortForward.layer.cornerRadius = 15.0;
//    btnPortForward.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //headerView.layer.doubleSided=YES;
//    btnPortForward.translatesAutoresizingMaskIntoConstraints=NO;
//    [btnPortForward addTarget:self action:@selector(dialCallCenter:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnPortForward];
//    
//    switchPortForward = [[UISwitch alloc] initWithFrame:CGRectMake(230,20,20,20)];
//    [switchPortForward addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
//    [btnPortForward addSubview:switchPortForward];
//    
//    
//    
////    CGRect webRect = CGRectMake(5, 2, 50, 50);
////    UIImageView *web =[[UIImageView alloc] initWithFrame:webRect];
////    web.image=[UIImage imageNamed:@"phone-icon.png"];
////    web.contentMode=UIViewContentModeCenter;
////    [btnPortForward addSubview:web];
////    benRect = CGRectMake(5, 7, 80, 80);
////    UILabel *webLabel = [[UILabel alloc] initWithFrame:webRect];
////    webLabel.text=@"";
////    webLabel.textColor=[UIColor redColor];
////    webLabel.font=[UIFont boldSystemFontOfSize:12];
////    [btnPortForward addSubview:webLabel];
//    
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPortForward attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPortForward attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPortForward attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.10 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPortForward attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];

    
}


- (void)changeSwitch:(id)sender{
    if([sender isOn]){
      
        SigletonClass *sObj=[SigletonClass sharedSingletonClass];
        [sObj setValue:@"YES" forKey:@"wifiEnabled"];
        NSLog(@"hostServerURL %@",[self ReadSingleTonInstanceVariable:@"hostServerURL"]);
        NSLog(@"Switch is ON");
        
    }
    else
    {
        
        NSLog(@"Switch is OFF");
    }
}

- (IBAction)dialCallCenter:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://1234567890p111"]];
    
    
}



-(void) displayMessage:(NSError *) error{
    
    UIAlertController * alertController=   [UIAlertController
                                            alertControllerWithTitle:@"message"
                                            message:@"Unable to connect to server, please try again"
                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Do some thing here
                                   [self.navigationController popViewControllerAnimated:YES];
                                   
                               }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end