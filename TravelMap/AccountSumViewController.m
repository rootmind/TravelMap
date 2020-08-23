//
//  AccountSumViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/15/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AccountSumViewController.h"
#import "DashboardViewController.h"
#import "AccountTrnViewController.h"
#import "AccountsData.h"
#import "SingletonClass.h"
#import "TransferViewController.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"




@interface AccountSumViewController ()

@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red




@implementation AccountSumViewController


@synthesize userid;
@synthesize sessionid;
@synthesize actionMode;

//@synthesize accountsKeyData;
//@synthesize accountsValueData;
@synthesize dataDictionary;

//@synthesize customerName;
//@synthesize customerSegment;

//@synthesize availableBalance;


//@synthesize accountName;
//@synthesize accountNumber;
//@synthesize accountCurrency;
//@synthesize accountAvlBalance;
//@synthesize accountCurrentBalance;
//@synthesize accountStatus;

@synthesize accountsArray;
@synthesize accounts;


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
    
    ////self.navigationItem.titleView=companyLogo;
    
    //self.navigationItem.title=@"Account Summary";
 
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    
    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
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
    
 
    


    
    
    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
    //card.contentMode=UIViewContentModeCenter;
    //[self.view addSubview:card];
    
    [self fetchAccounts];
    

    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.frame = CGRectMake(30,200,270,300);
    tableView.backgroundColor = [UIColor whiteColor];//[UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableView.layer.borderWidth=1.0f;
    tableView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    tableView.layer.cornerRadius=15.0f;
    //tableView.allowsSelection = NO;
    tableView.alwaysBounceVertical = NO;
    tableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0);
    
    tableView.sectionHeaderHeight = 0.0;
    tableView.sectionFooterHeight = 0.0;

    //self.edgesForExtendedLayout = UIRectEdgeNone;

    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    tableTitle.textColor = [UIColor captionColor];
    tableTitle.backgroundColor = [tableView backgroundColor];
    tableTitle.opaque = YES;
    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    tableTitle.textAlignment=NSTextAlignmentCenter;
    tableTitle.text = @"Accounts";
    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
    tableView.tableHeaderView = tableTitle;

    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //[tableView setSeparatorColor:[UIColor whiteColor]];
    tableView.separatorInset=UIEdgeInsetsZero;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    
    // add to canvas
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:tableView];
    
    
    
    //[self drawRect:titleRect];
    //
    
    // important! without this line it does not work!
    //[tableView setBackgroundView:[[UIView alloc] init]];
    // set plain background color
    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
    // remove seperator color


 
    //tableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
    
//    CGRect frame = tableView.tableHeaderView.frame;
//    frame.size.height = 1;
//    UIView *headerView = [[UIView alloc] initWithFrame:frame];
//    [tableView setTableHeaderView:headerView];
    
    

    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.57 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
  
    
    
//    UIView *outerView = [[UIView alloc] initWithFrame:bounds];
//    outerView.layer.borderWidth=1.0;
//    outerView.layer.borderColor=[UIColor blueColor].CGColor;
//    outerView.layer.shadowRadius=10.0;
//    outerView.backgroundColor = [UIColor whiteColor];
//    outerView.layer.shadowOffset = CGSizeMake(0, 3);
//    outerView.layer.shadowRadius = 10.0;
//    outerView.layer.shadowColor = [UIColor blackColor].CGColor;
//    outerView.layer.shadowOpacity = 0.8;
//    outerView.layer.cornerRadius = 15.0;
//    //headerView.layer.doubleSided=YES;
//    //outerView.translatesAutoresizingMaskIntoConstraints=NO;
//    [tableView addSubview:outerView];
    
    
    
    [self displayHeader];

    
    
//    accountName=[NSArray arrayWithObjects:@"Current Account",@"Savings Account",@"eSaver Account",nil];
//    accountNumber=[NSArray arrayWithObjects:@"010003706",@"010064717",@"010669481",nil];
//    accountCurrency=[NSArray arrayWithObjects:@"AED",@"USD",@"INR",nil];
//    accountAvlBalance=[NSArray arrayWithObjects:@"100,273.56",@"46,576.12",@"5,466.88",nil];
//    accountCurrentBalance=[NSArray arrayWithObjects:@"46,474.67",@"477,575.34",@"585,464.57",nil];
//    accountStatus=[NSArray arrayWithObjects:@"Active",@"Dormant",@"Active",nil];
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
}



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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //return [accountName count];
    //return [customerInfo.count count];
    return [accountsArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    //Region *region = [regions objectAtIndex:section];
    //return [region.timeZoneWrappers count];
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //GFloat result;
    //switch ([indexPath row])
    //{
    //    case 0: {
    //        result = kUIRowHeight;
    //        break; }
    //    case 1: {
    //        result = kUIRowLabelHeight;
    //        break; }
    //}
    return 75;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    //Region *region = [regions objectAtIndex:section];
    //return [region name];
    
    
    if(section == 0)
    {

//        
//        
//        
//        // Return the headerView
//        return headerView;
    
        //return [NSString stringWithFormat:@"Accounts"];
        return nil;
    
    }
    else
        
    //    return @"Credit Card";
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 0.00f;
    }
    return 10.0f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*if ((indexPath.row % 2) == 1) {
     cell.backgroundColor = [UIColor grayColor];
     //cell.textLabel.backgroundColor = [UIColor blackColor];
     cell.selectionStyle = UITableViewCellSelectionStyleGray;
     }
     else
     {
     cell.backgroundColor = [UIColor whiteColor];
     
     }*/
    
    cell.backgroundColor=[UIColor cellBGColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor lightGrayColor];
    cell.layer.borderWidth=1.0f;
    cell.layer.cornerRadius=15.0f;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.layer.borderColor=[UIColor borderColor].CGColor;
    cell.layer.shadowRadius=3.0f;
    cell.layer.shadowOffset = CGSizeMake(0, 3);
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOpacity = 0.8;
    
    
    
    
    
    //[cell.layer setBorderColor:[UIColor grayColor].CGColor];
    //[cell setTintColor:[UIColor redColor]];

    //cell.separatorInset = UIEdgeInsetsMake(0.f, 0.f, 0.f, cell.bounds.size.width);
    
    
    //if (indexPath.row != 0)
    //{
//        cell.contentView.backgroundColor = [UIColor clearColor];
//        UIView *whiteRoundedCornerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,cell.frame.size.width,cell.frame.size.height)];
//        whiteRoundedCornerView.backgroundColor = [UIColor whiteColor];
//        whiteRoundedCornerView.layer.masksToBounds = NO;
//        whiteRoundedCornerView.layer.cornerRadius = 3.0;
//        whiteRoundedCornerView.layer.shadowOffset = CGSizeMake(-1, 1);
//        whiteRoundedCornerView.layer.shadowOpacity = 0.5;
//        [cell.contentView addSubview:whiteRoundedCornerView];
//        [cell.contentView sendSubviewToBack:whiteRoundedCornerView];
    
    //}

    
//    [cell.layer setShadowColor:[UIColor grayColor].CGColor];
//    [cell.layer setShadowOpacity:0.8f];
//    [cell.layer setShadowRadius:12.0f];
//    cell.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
    
    
    //UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    //CALayer *sublayerHeader = [CALayer layer];
    //sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
    //sublayerHeader.shadowOffset = CGSizeMake(0, 3);
    //sublayerHeader.shadowRadius = 10.0;
    //sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
    //sublayerHeader.shadowOpacity = 0.8;
    //sublayerHeader.cornerRadius = 10.0;
    //sublayerHeader.frame = CGRectMake(0, 0, tableView.bounds.size
    //  .width, tableView.bounds.size.height);
    //[shadowView.layer addSublayer:sublayerHeader];
    //[self.view.layer addSublayer:sublayerHeader];
    //[cell.contentView addSubview:shadowView];
    
    //[cell.layer addSublayer:sublayerHeader];
    
    
    
    /*cell.contentView.layer.cornerRadius = 15.0f;
     cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
     cell.contentView.layer.borderWidth = 1.0f;*/
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
   
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
        
        //cell.separatorInset=UIEdgeInsetsMake(0,0,0,cell.frame.size.width);
        
      
        //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DetailDisclosureRed.png"]];
        cell.accessoryView = [UIImageView accessoryImage];
    }
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    //cell.textLabel.textColor=[UIColor blueColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:10.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
    cell.detailTextLabel.font  = mySecondFont;
    //cell.detailTextLabel.textColor=[UIColor blueColor];
    
    
    //top shadow
    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
    //CAGradientLayer *topShadow = [CAGradientLayer layer];
    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
    
    //[cell.contentView addSubview:topShadowView];
    

    
    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
    //imv.image=[UIImage imageNamed:@"money-wallet-icon.png"];
    cell.imageView.image=[[UIImage imageNamed:@"account-sum-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = cell.bounds;
//    gradient.layer.cornerRadius=10.0f;
//    gradient.color=[UIColor whiteColor];
//    //gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor redColor]CGColor], nil];
//    [cell.layer addSublayer:gradient];
    
    
    //[cell addSubview:imv];
    
    
    NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
    NSLog(@"table view%ldd",(long) indexPath.section);
    
    
//    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",[self.accountNumber objectAtIndex:indexPath.row],[self.accountCurrency objectAtIndex:indexPath.row],[self.accountCurrentBalance objectAtIndex:indexPath.row]];
    
    //accounts = [accountsArray objectAtIndex:indexPath.row];
    accounts = [accountsArray objectAtIndex:indexPath.section];

  

    
    cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@ %@\n%@",accounts.accountDesc,accounts.availableBalance,accounts.accountCurrency,accounts.accountNumber];
    cell.textLabel.numberOfLines=3;
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
//    NSString *CRDRflag = [[NSString alloc] init];
//    
//    if([accounts.CRDRflag isEqual:@"CR"])
//    {
//        CRDRflag=@"+";
//    }
//    else
//    {
//        CRDRflag=@"-";
//    }
    
    //cell.detailTextLabel.text=[NSString stringWithFormat:@"\n%@  %@",accounts.availableBalance,accounts.accountCurrency];
    //cell.detailTextLabel.numberOfLines=0;
    //cell.detailTextLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
//    cell.textLabel.text =[NSString stringWithFormat:@"%@",accounts.accountDesc];
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",accounts.accountNumber,accounts.availableBalance,accounts.accountCurrency];
    
    
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    // Create a view controller with the title as its
//    // navigation title and push it.
//    NSUInteger row = indexPath.row;
//    if (row != NSNotFound)
//    {
//        // Create the view controller and initialize it with the
//        // next level of data.
//        MyViewController *viewController = [[MyViewController alloc]
//                                            initWithTable:tableView andDataAtIndexPath:indexPath];
//        [[self navigationController] pushViewController:viewController
//                                               animated:YES];
//    }
 
    NSUInteger row = indexPath.section;//row;
    
 
    
        if (row != NSNotFound)
        {
            accounts = [accountsArray objectAtIndex:indexPath.section];
            
            NSLog(@"selected account %@",accounts.accountNumber);
            
            if([actionMode isEqualToString:@"TRNHISTORY"])
            {
            
            
                AccountTrnViewController *accountTrnViewController = [[AccountTrnViewController alloc]initWithNibName:nil bundle:nil];
                
                //NSLog(@"selected account %@",[self.accountsValueData objectAtIndex:indexPath.row]);
                
                accountTrnViewController.cifNumber=accounts.cifNumber;
                accountTrnViewController.accountNumber=accounts.accountNumber;
                accountTrnViewController.sessionid=self.sessionid;
                accountTrnViewController.userid=self.userid;
                
                [self.navigationController pushViewController:accountTrnViewController animated:YES];
                
            }
            else
            {
            
                TransferViewController *transferViewController = [[TransferViewController alloc]initWithNibName:nil bundle:nil];
                transferViewController.cifNumber=accounts.cifNumber;
                transferViewController.accountNumber=accounts.accountNumber;
                transferViewController.userid=self.userid;
                transferViewController.sessionid=self.sessionid;
                [self.navigationController pushViewController:transferViewController animated:YES];
            }
            
            
            
        }
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{

}






//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"BackACSumSegue"])
//    {
//        DashboardViewController *dashboardViewController = [segue destinationViewController];
//        dashboardViewController.sessionid=self.sessionid;
//        dashboardViewController.userid=self.userid;
//    }
//}


- (void) fetchAccounts  {
    
    
    @try {
        
        
        
        NSLog(@"fetch Accounts %@",userid);
        
        
        
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
        
        
        
        //string for the URL request
        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/AccountsServlet";
        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://92.97.103.252:8081";
        //create string for parameters that we need to send in the HTTP POST body
        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=fetchAccounts",userid,sessionid];
        
        
        //create a NSURL object from the string data
        NSURL *myUrl = [NSURL URLWithString:myUrlString];
        
        //create a mutable HTTP request
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
        //sets the receiver’s timeout interval, in seconds
        [urlRequest setTimeoutInterval:120.0f];
        //sets the receiver’s HTTP request method
        [urlRequest setHTTPMethod:@"POST"];
        //sets the request body of the receiver to the specified data.
        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
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
        
        NSLog(@"Exception in fetch Accounts code %@ reason %@ " , [exception name], [exception reason]);
    }
    @finally {
        
        NSLog(@"finally in fetch Accounts Code");
    }
    
    
}


- (void) parseResponse:(NSData *) data {
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
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
                dataDictionary =[jsonObject objectForKey:@"fetchAccounts"];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                accountsArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:@"accountsWrapper"];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    accounts = [[AccountsData alloc] initWithJSONDictionary:dict];
                    NSLog(@" accounts %@",accounts.accountNumber);
                    
                    // Add the Location object to the array
                    [accountsArray addObject:accounts];
                }
  
                
                NSLog(@"data count %lu",(unsigned long)accountsArray.count);
                
            
                
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


- (void) displayHeader{
    
    
    if(accountsArray.count >0)
    {
    
        accounts = [accountsArray objectAtIndex:0];

        //capture first account details
        //customerName=[NSString stringWithFormat:@"%@",accounts.customerName ];
        //customerSegment=[NSString stringWithFormat:@"%@",accounts.customerSegment];
        //NSLog(@" custname %@",customerName);
        //NSLog(@" custseg %@",customerSegment);
    }
    

    UIView *headerView = [[UIView alloc] init];
    headerView.layer.borderWidth=1.0;
    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    headerView.layer.shadowRadius=10.0;
    headerView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
    headerView.layer.shadowOffset = CGSizeMake(0, 3);
    headerView.layer.shadowRadius = 10.0;
    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
    headerView.layer.shadowOpacity = 0.8;
    headerView.layer.cornerRadius = 15.0;
    //headerView.layer.doubleSided=YES;
    headerView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:headerView];
   
    //create the frame that will contain our label
    //CGRect labelFrame = CGRectMake(40, 60, 240, 80);

    NSLog(@" frame width %lf",headerView.bounds.size.width);
     NSLog(@" frame height %lf",headerView.bounds.size.height);

    
    //CGRectMake(25, 90, 270, 100);
    //labelFrame.size.height = 00.0f;
    UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCustomerName.textColor = [UIColor blackColor];
    //set the number of lines to contain a bigger text
    //lblCustomerName.numberOfLines = 2;
    //lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
    lblCustomerName.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCustomerName.textAlignment =  NSTextAlignmentLeft;
    //lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerName.layer.borderWidth = 1.0;
    if(accountsArray.count >0)
    {
           lblCustomerName.text =[NSString stringWithFormat:@"%@",accounts.customerName];
    }
    lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCustomerName];
    
    
    
    //move the frame position
    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
    //headerView.bounds.origin.y +=  15.0f;
    UILabel *lblCustomerSegment = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCustomerSegment.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCustomerSegment.textAlignment =  NSTextAlignmentLeft;
    lblCustomerSegment.textColor = [UIColor blackColor];
    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerNumber.layer.borderWidth = 1.0;
    
    if(accountsArray.count >0)
    {
        lblCustomerSegment.text = [NSString stringWithFormat:@"%@",accounts.customerSegment];
    }
    lblCustomerSegment.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCustomerSegment];

    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
    //----customer name
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.9 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
    //-----customer segement
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
    

    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];
//    
    
//    //labelFrame.origin.y += labelFrame.size.height + 1.0f;
//    labelFrame.origin.y +=  20.0f;
//    UILabel *lblavalBalance  = [[UILabel alloc] initWithFrame:labelFrame];
//    lblavalBalance.textColor = [UIColor blackColor];
//    lblavalBalance.text = [NSString stringWithFormat:@"Available Balance    %@",availableBalance];
//    //set the number of lines to 0, meaning use as many lines as needed
//    lblavalBalance.numberOfLines = 0;
//    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
//    lblavalBalance.font = [UIFont boldSystemFontOfSize:12.0f];
//    lblavalBalance.textAlignment =  NSTextAlignmentLeft;
//    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
//    //lblavalBalance.layer.borderWidth = 1.0;
//    //Resizes and moves the receiver view so it just encloses its subviews.
//    //watch the border of the frame in this example
//    //[lblavalBalance sizeToFit];
//    [self.view addSubview:lblavalBalance];
    
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
    


    
//    
//    UIAlertController * alert=   [UIAlertController
//                                  alertControllerWithTitle:@"My Title"
//                                  message:@"Enter User Credentials"
//                                  preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                               handler:^(UIAlertAction * action) {
//                                                   //Do Some action here
//                                                   
//                                               }];
//    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
//                                                   handler:^(UIAlertAction * action) {
//                                                       [alert dismissViewControllerAnimated:YES completion:nil];
//                                                   }];
//    
//    [alert addAction:ok];
//    [alert addAction:cancel];
//    
//    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//        textField.placeholder = @"Username";
//    }];
//    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//        textField.placeholder = @"Password";
//        textField.secureTextEntry = YES;
//    }];
//    
//    [self presentViewController:alert animated:YES completion:nil];
//    
}


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
