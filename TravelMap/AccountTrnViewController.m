//
//  AccountTrnViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/25/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AccountTrnViewController.h"
#import "AccountTrnData.h"
#import "AccountsData.h"
#import "PopoverViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"

@interface AccountTrnViewController ()

@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

@implementation AccountTrnViewController

@synthesize actIndSearch;
@synthesize cifNumber;
@synthesize accountNumber;
//@synthesize CustTableView;
//@synthesize custKeyData;
//@synthesize custValueData;
//@synthesize customerInfo;

//@synthesize customerName;
//@synthesize availableBalance;
@synthesize userid;
@synthesize sessionid;
@synthesize tableView;

@synthesize dataDictionary;
@synthesize accountTrnArray;
@synthesize accountDataDictionary;
@synthesize accountsArray;
@synthesize accountTrn;
@synthesize accounts;



//@synthesize topleft;
//@synthesize topright;
//@synthesize bottomleft;
//@synthesize bottomright;
//@synthesize bglayer;
//@synthesize roundTop;
//@synthesize roundBottom;



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
    
    //self.navigationItem.title=@"Account Transactions";
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    
    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
//    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
//    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
//    //companyLogo.contentMode=UIViewContentModeCenter;
//    companyLogo.contentMode = UIViewContentModeScaleToFill;
//    companyLogo.clipsToBounds = NO;
//    //[self.view addSubview:companyLogo];
//    
//    //self.navigationItem.titleView=companyLogo;
    
    
    
    
    
    //layers
    //self.view.clipsToBounds=NO;
    //self.view.layer.masksToBounds=NO;
    //self.view.layer.backgroundColor = [UIColor whiteColor].CGColor;
    //self.view.layer.cornerRadius = 40.0;
    //self.view.layer.shadowOpacity=0.5;
    //self.view.layer.frame = CGRectInset(self.view.layer.frame, 20, 20);
    //self.view.layer.frame = CGRectMake(30, 200, 260, 310);
//    CALayer *sublayerHeader = [CALayer layer];
//    sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
//    sublayerHeader.shadowOffset = CGSizeMake(0, 3);
//    sublayerHeader.shadowRadius = 10.0;
//    sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
//    sublayerHeader.shadowOpacity = 0.8;
//    sublayerHeader.cornerRadius = 30.0;
//    sublayerHeader.frame = CGRectMake(30, 80, 270, 100);
//    [self.view.layer addSublayer:sublayerHeader];
//    CALayer *sublayerDetails = [CALayer layer];
//    sublayerDetails.backgroundColor = [UIColor whiteColor].CGColor;//[UIColor orangeColor].CGColor;
//    sublayerDetails.shadowOffset = CGSizeMake(0, 3);
//    sublayerDetails.shadowRadius = 10.0;
//    sublayerDetails.shadowColor = [UIColor blackColor].CGColor;
//    sublayerDetails.shadowOpacity = 0.8;
//    sublayerDetails.cornerRadius = 30.0;
//    sublayerDetails.frame = CGRectMake(30, 200, 270, 300);
//    [self.view.layer addSublayer:sublayerDetails];
    
    
    
    
    [self getAccountTrn];
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.frame = CGRectMake(30,200,270,300);
    tableView.backgroundColor = [UIColor whiteColor];//[UIColor groupTableViewBackgroundColor];//
    tableView.layer.borderWidth=1.0f;
    tableView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    tableView.layer.cornerRadius=15.0f;
    tableView.allowsSelection = NO;
    tableView.alwaysBounceVertical = NO;
    tableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0);
    
    tableView.sectionHeaderHeight = 0.0;
    tableView.sectionFooterHeight = 0.0;
    
    //tableView.layer.cornerRadius = 30.0f;
    //[tableView.layer setMasksToBounds:YES];
    
    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    tableTitle.textColor = [UIColor captionColor];
    tableTitle.backgroundColor = [tableView backgroundColor];
    tableTitle.opaque = YES;
    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    tableTitle.textAlignment=NSTextAlignmentCenter;
    tableTitle.layer.cornerRadius=15.0f;
    tableTitle.text = @"Account Transactions";
    tableView.tableHeaderView = tableTitle;
    
    //tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    // add to canvas
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:tableView];
    
    // important! without this line it does not work!
    //[tableView setBackgroundView:[[UIView alloc] init]];
    // set plain background color
    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
    // remove seperator color
    //tableView.backgroundColor=[UIColor clearColor];

    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //[tableView setSeparatorColor:[UIColor blackColor]];
    
    
//    
//        CGRect frame = self.tableView.tableHeaderView.frame;
//        frame.size.height = 0.01f;
//        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:frame];
    //
    //

    

 
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.57 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
    [self displayHeader];
    
//    if([accountTrnArray count]<=0)
//    {
//        [self displayMessage:nil];
//     }

    
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
    
    return [accountTrnArray count];
    //return [customerInfo.count count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    //Region *region = [regions objectAtIndex:section];
    //return [region.timeZoneWrappers count];
    //NSLog(@"count %lu",(unsigned long)[custKeyData count]);
    return 1;//[accountTrnArray count];
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

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
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
     cell.selectionStyle = UITableViewCellSelectionStyleGray;
     }*/
    
    cell.backgroundColor=[UIColor cellBGColor];//[UIColor whiteColor];
    cell.layer.borderWidth=1.0f;
    cell.layer.cornerRadius=15.0f;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.layer.borderColor=[UIColor borderColor].CGColor;
    cell.layer.shadowRadius=3.0f;
    cell.layer.shadowOffset = CGSizeMake(0, 3);
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOpacity = 0.8;
    
    
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
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
    }
    
    
//    cell.contentView.layer.cornerRadius = 15.0f;
//    cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
//    cell.contentView.layer.borderWidth = 1.0f;
    
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    //    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.custKeyData objectAtIndex:indexPath.row]];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",[self.custValueData objectAtIndex:indexPath.row]];
   
    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial" size: 14.0 ];
    cell.textLabel.font  = myFont;
    cell.textLabel.textColor=[UIColor blackColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial" size: 10.0 ];
    cell.detailTextLabel.font  = mySecondFont;
    cell.detailTextLabel.textColor=[UIColor blackColor];
    
    //NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
    
    accountTrn = [accountTrnArray objectAtIndex:indexPath.section];//].row];
    

    
    NSString *CRDRflag = [[NSString alloc] init];
    
    if([accountTrn.CRDRflag isEqual:@"CR"])
    {
        CRDRflag=@"+";
    }
    else
    {
        CRDRflag=@"-";
    }
    
    //NSString *trnDate= [accountTrn.trnDate stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *narration1=accountTrn.narration1;
    
    if ([narration1 length] > 25 ) {
        narration1 =  [NSString stringWithFormat:@"%@",[narration1 substringToIndex:25]];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@",accountTrn.trnDate,narration1,accountTrn.narration2];
    cell.textLabel.numberOfLines=3;
    cell.textLabel.lineBreakMode=NSLineBreakByTruncatingTail;
 
    
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@%@ %@",CRDRflag,accountTrn.trnAmount,accountTrn.trnCurrency];
    cell.detailTextLabel.numberOfLines=1;
    cell.detailTextLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    
    
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@      %@ %@  %@\n%@",accountTrn.narration1,CRDRflag,accountTrn.trnAmount,accountTrn.trnCurrency,accountTrn.narration2];
        //cell.detailTextLabel.text=[NSString stringWithFormat:@"%@      \n%@",accountTrn.narration1,accountTrn.narration2];
    
    
    
    
    //    NSString *twoWords = [NSString stringWithFormat:@"%@;%@ %@ %@ \n%@",accountTrn.narration1,CRDRflag,accountTrn.trnAmount,accountTrn.trnCurrency,accountTrn.narration2];
    //    NSArray *components = [twoWords componentsSeparatedByString:@";"];
    //    NSRange greenRange = [twoWords rangeOfString:[components objectAtIndex:0]];
    //    NSRange redRange = [twoWords rangeOfString:[components objectAtIndex:1]];
    //
    //    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:twoWords];
    //
    //    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    //    //paragraph.maximumLineHeight = 12.0f;
    //    paragraph.alignment = NSTextAlignmentLeft;
    //
    //    NSMutableParagraphStyle *paragraph1 = [[NSMutableParagraphStyle alloc] init];
    //    //paragraph1.maximumLineHeight = 12.0f;
    //    paragraph1.alignment = NSTextAlignmentRight;
    //
    //    //NSTextTab *t = [[NSTextTab alloc] initWithTextAlignment:NSTextAlignmentRight location:twoWords.size.width options:nil];
    //    //paragraph.tabStops = @[t];
    //
    //    [attrString beginEditing];
    //    [attrString addAttribute: NSForegroundColorAttributeName
    //                       value:[UIColor greenColor]
    //                       range:greenRange];
    //    [attrString addAttribute:NSParagraphStyleAttributeName
    //                       value:paragraph
    //                       range:greenRange];
    //
    //    [attrString addAttribute: NSForegroundColorAttributeName
    //                       value:[UIColor redColor]
    //                       range:redRange];
    //
    //    [attrString addAttribute:NSParagraphStyleAttributeName
    //                       value:paragraph1
    //                       range:redRange];
    //    
    //    [attrString endEditing];
    //    
    //    
    //    cell.detailTextLabel.attributedText=attrString;
    
    


    
//    UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,18,235,10)]; //put in the frame variables you desire
//    subLabel.textAlignment = NSTextAlignmentRight;
//    subLabel.text = [NSString stringWithFormat:@"%@  %@",accountTrn.trnAmount,accountTrn.trnCurrency];
//    subLabel.font=mySecondFont;
//    [cell.contentView addSubview:subLabel];
    


    
    

    
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@   %@   %@",accountTrn.narration1,accountTrn.narration2,accountTrn.CRDRflag];
    //
    //    [cell setAccessibilityLabel:[NSString stringWithFormat:@"%@, %@", accountTrn.trnCurrency,
    //                                 accountTrn.trnAmount]];
    
    // draw round top corners in first row
    /*if(indexPath.row == 0){
     [self drawRoundTop];
     }
     // draw round corners in last row
     if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
     [self drawRoundBottom];
     }*/
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    //UIView *aView = [[UIView alloc] init];
//    // initialize view here
//    
//    PopoverViewController *popoverViewController = [[PopoverViewController alloc] initWithNibName:nil bundle:nil];
//    
//    
//    UIPopoverController *popoverController = [[UIPopoverController alloc]
//                                              initWithContentViewController:popoverViewController];
//    popoverController.popoverContentSize = CGSizeMake(320, 416);
//
//    
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    [popoverController presentPopoverFromRect:cell.bounds inView:cell.contentView
//                     permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//
//    // release popover in 'popoverControllerDidDismissPopover:' method
    
}


//
//- (void)viewWillAppear:(BOOL)animated{
////    CGRect frame = tableView.tableHeaderView.frame;
////    frame.size.height = 1;
////    UIView *headerView = [[UIView alloc] initWithFrame:frame];
////    [tableView setTableHeaderView:headerView];
//}


//-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if(section == 0)
//        return CGFLOAT_MIN;;
//    return CGFLOAT_MIN;;
//}
//

//



- (void) getAccountTrn  {
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@  %@",cifNumber,accountNumber);
        
        
        
        
        self.actIndSearch.hidesWhenStopped=YES;
        [self.actIndSearch startAnimating];
        
        
        
        //string for the URL request
        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/AccountsServlet";
        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://92.97.103.252:8081";///AccountsServlet";
        //create string for parameters that we need to send in the HTTP POST body
        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=fetchAccountTrn&cifNumber=%@&accountNumber=%@",userid,sessionid,cifNumber,accountNumber];
        
        
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
        }
        
        
        
        
        
        
        
        
        [self.actIndSearch stopAnimating];
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in getCustomer code %@ reason %@ " , [exception name], [exception reason]);
    }
    @finally {
        
        NSLog(@"finally in getCustomer Code");
    }
    
    
}


/*
 - (void) parseResponse:(NSData *) data {
 
 
 @try {
 
 
 
 NSLog(@"get customer info enterest %@",txtCustomerNumber);
 
 
 
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
 customerInfo =[jsonObject objectForKey:@"getCustomerInfo"];
 
 NSLog(@"Dictionary: %@", [customerInfo description]);
 
 
 for(NSString *key in [customerInfo allKeys]) {
 NSLog(@"key code: %@",key);
 NSLog(@"key: %@",[customerInfo objectForKey:key]);
 
 if ([key isEqualToString:@"custId"]) {
 self.txtCustomerNumber=[customerInfo objectForKey:@"custId"];
 }
 if ([key isEqualToString:@"custName"]) {
 self.customerName=[customerInfo objectForKey:@"custName"];
 }
 if ([key isEqualToString:@"currentAccountBalance"]) {
 self.availableBalance=[customerInfo objectForKey:@"currentAccountBalance"];;
 }
 
 
 //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
 
 }
 
 
 
 //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
 custKeyData = [[NSArray alloc] initWithArray:[customerInfo allKeys]];
 custValueData = [[NSArray alloc] initWithArray:[customerInfo allValues]];
 
 for (NSString *string in custKeyData) {
 NSLog(@" array key data:%@", string);
 }
 
 for (NSString *string in custValueData) {
 NSLog(@" array value data:%@", string);
 }
 
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
 
 }*/

- (void) parseResponse:(NSData *) data {
    
    
    @try {
        
        
        
        NSLog(@"get account trn enter %@  %@",cifNumber,accountNumber);
        
        
        
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
                
          
                //-------------------------
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:@"fetchAccountTrn"];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                accountTrnArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:@"accountTrnWrapper"];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    accountTrn = [[AccountTrnData alloc] initWithJSONDictionary:dict];
                    NSLog(@" accountTrn %@",accountTrn.accountNumber);
                    
                    // Add the Location object to the array
                    [accountTrnArray addObject:accountTrn];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)accountTrnArray.count);

                //--------------------
                //----------------
                //set the account object of the header
                accountDataDictionary =[jsonObject objectForKey:@"fetchAccounts"];
                
                NSLog(@"Dictionary: %@", [accountDataDictionary description]);
                
                
                for(NSString *key in [accountDataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[accountDataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                accountsArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array1 = [accountDataDictionary objectForKey:@"accountsWrapper"];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array1) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    accounts = [[AccountsData alloc] initWithJSONDictionary:dict];
                    NSLog(@" accounts %@",accounts.accountNumber);
                    
                    // Add the Location object to the array
                    [accountsArray addObject:accounts];
                }
                
                
                //NSLog(@"data count %lu",(unsigned long)accountsArray.count);
                
                
                //-----------
                
                
                
                
                
                
                
                
//                NSDictionary *customerMasterData = [customerInfo objectForKey:@"Customer Master Data"];
//                
//                for(NSString *key in [customerMasterData allKeys])
//                {
//                    NSLog(@"key code: %@",key);
//                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
//                    
//                    if ([key isEqualToString:@"Customer number"]) {
//                        self.txtCustomerNumber=[customerMasterData objectForKey:@"Customer number"];
//                    }
//                    if ([key isEqualToString:@"Customer name"]) {
//                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
//                    }
//                    //if ([key isEqualToString:@"currentAccountBalance"]) {
//                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
//                    //}
//                    
//                }
//                
//                NSDictionary *customerDetailData = [customerInfo objectForKey:@"Customer Detail Data"];
//                
//                
//                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
//                custKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
//                custValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
//                
//                
//                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                
//                for (NSString *string in custKeyData) {
//                    NSLog(@" array key data:%@", string);
//                }
//                
//                for (NSString *string in custValueData) {
//                    NSLog(@" array value data:%@", string);
//                }
//                
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
                NSLog(@"CIF and Account Number is Invalid...");
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


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"CustSearchSegue"])
//    {
//        SearchViewController *searchViewController = [segue destinationViewController];
//        searchViewController.sessionid=self.sessionid;
//        searchViewController.userid=self.userid;
//    }
//}


- (void) displayHeader{
    
    //create the frame that will contain our label
    //CGRect labelFrame = CGRectMake(30.0f, 65.0f, 270.0f, 100.0f);
    
    //CGRect labelFrame = CGRectMake(40, 50, 240, 100);
    
    if(accountsArray.count >0)
    {
        
        accounts = [accountsArray objectAtIndex:0];
        
//        //capture first account details
//        customerName=[NSString stringWithFormat:@"%@",accounts.customerName ];
//        customerSegment=[NSString stringWithFormat:@"%@",accounts.customerSegment];
//        NSLog(@" custname %@",customerName);
//        NSLog(@" custseg %@",customerSegment);
    }
    
    UIView *headerView = [[UIView alloc] init];
    headerView.layer.borderWidth=1.0;
    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    headerView.layer.shadowRadius=10.0;
    headerView.backgroundColor = [UIColor whiteColor];//[UIColor groupTableViewBackgroundColor];//
    headerView.layer.shadowOffset = CGSizeMake(0, 3);
    headerView.layer.shadowRadius = 10.0;
    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
    headerView.layer.shadowOpacity = 0.8;
    headerView.layer.cornerRadius = 15.0;
    headerView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:headerView];
    
    
    //CGRectMake(25, 90, 270, 100);
    //labelFrame.size.height = 00.0f;
    UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:labelFrame];
    
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
    //labelFrame.origin.y +=  15.0f;
    UILabel *lblCustomerSegment = [[UILabel alloc] init];//WithFrame:labelFrame];
    
    lblCustomerSegment.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCustomerSegment.textAlignment =  NSTextAlignmentLeft;
    lblCustomerSegment.textColor = [UIColor blackColor];
    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerNumber.layer.borderWidth = 1.0;
    if(accountsArray.count >0)
    {
        lblCustomerSegment.text = [NSString stringWithFormat:@"%@ %@",accounts.accountNumber,accounts.customerSegment];
    }
    lblCustomerSegment.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCustomerSegment];

    
    //labelFrame.origin.y += labelFrame.size.height + 1.0f;
    //labelFrame.origin.y +=  15.0f;
    UILabel *lblcurrBal  = [[UILabel alloc] init];//WithFrame:labelFrame];
    lblcurrBal.textColor = [UIColor blackColor];
    
    //set the number of lines to 0, meaning use as many lines as needed
    lblcurrBal.numberOfLines = 0;
    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
    lblcurrBal.font = [UIFont boldSystemFontOfSize:14.0f];
    lblcurrBal.textAlignment =  NSTextAlignmentLeft;
    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
    //lblavalBalance.layer.borderWidth = 1.0;
    //Resizes and moves the receiver view so it just encloses its subviews.
    //watch the border of the frame in this example
    //[lblavalBalance sizeToFit];
    if(accountsArray.count >0)
    {
        lblcurrBal.text = [NSString stringWithFormat:@"Current Balance"];
    }
    lblcurrBal.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblcurrBal];
    
    //labelFrame.origin.x +=  10.0f;
    UILabel *lblcurrBalValue  = [[UILabel alloc] init];//WithFrame:labelFrame];
    lblcurrBalValue.textColor = [UIColor blackColor];
    
    //set the number of lines to 0, meaning use as many lines as needed
    lblcurrBalValue.numberOfLines = 0;
    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
    lblcurrBalValue.font = [UIFont boldSystemFontOfSize:14.0f];
    lblcurrBalValue.textAlignment =  NSTextAlignmentRight;
    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
    //lblavalBalance.layer.borderWidth = 1.0;
    //Resizes and moves the receiver view so it just encloses its subviews.
    //watch the border of the frame in this example
    //[lblavalBalance sizeToFit];
    if(accountsArray.count >0)
    {
        lblcurrBalValue.text = [NSString stringWithFormat:@"%@ %@",accounts.currentBalance,accounts.accountCurrency];
    }
    lblcurrBalValue.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblcurrBalValue];
    
    
    
    //labelFrame.origin.y += labelFrame.size.height + 1.0f;
    //labelFrame.origin.x=40;
    //labelFrame.origin.y =  95.0f;
    UILabel *lblavalBal  = [[UILabel alloc] init];//WithFrame:labelFrame];
    lblavalBal.textColor = [UIColor blackColor];
    
    //set the number of lines to 0, meaning use as many lines as needed
    lblavalBal.numberOfLines = 0;
    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
    lblavalBal.font = [UIFont boldSystemFontOfSize:14.0f];
    lblavalBal.textAlignment =  NSTextAlignmentLeft;
    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
    //lblavalBalance.layer.borderWidth = 1.0;
    //Resizes and moves the receiver view so it just encloses its subviews.
    //watch the border of the frame in this example
    //[lblavalBalance sizeToFit];
    if(accountsArray.count >0)
    {
        lblavalBal.text = [NSString stringWithFormat:@"Available Balance"];
    }
    lblavalBal.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblavalBal];

    //labelFrame.origin.x +=  10.0f;
    UILabel *lblavalBalValue  = [[UILabel alloc] init];//WithFrame:labelFrame];
    lblavalBalValue.textColor = [UIColor blackColor];
    
    //set the number of lines to 0, meaning use as many lines as needed
    lblavalBalValue.numberOfLines = 0;
    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
    lblavalBalValue.font = [UIFont boldSystemFontOfSize:14.0f];
    lblavalBalValue.textAlignment =  NSTextAlignmentRight;
    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
    //lblavalBalance.layer.borderWidth = 1.0;
    //Resizes and moves the receiver view so it just encloses its subviews.
    //watch the border of the frame in this example
    //[lblavalBalance sizeToFit];
    if(accountsArray.count >0)
    {
        lblavalBalValue.text = [NSString stringWithFormat:@"%@ %@",accounts.availableBalance,accounts.accountCurrency];
    }
    lblavalBalValue.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblavalBalValue];
    

    //labelFrame.origin.y += 65.0f;
    //labelFrame.origin.x +=10.0f;
    UIProgressView *progressView = [[UIProgressView alloc] init];//WithFrame:labelFrame];//CGRectMake(90.0f, 175.0f, 150.0f, 100.0f)];
    [progressView setProgressViewStyle:UIProgressViewStyleDefault];
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 5.2f);// you can change the sy as you want
    //progressView.tintColor=[UIColor blueColor];
    //progressView.progressTintColor=[UIColor blueColor];
    //progressView.trackTintColor=[UIColor yellowColor];
    progressView.transform = transform;
    progressView.layer.cornerRadius=15.0f;
    //progressView.layer.masksToBounds=YES;
    //progressView.clipsToBounds=YES;
    progressView.progress = 0.25f;
    progressView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview: progressView];
    
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
    //----customer name
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
    //-----customer segement
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.9 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
    
    //-----curr bal caption
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblcurrBal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblcurrBal attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];

    //-----curr bal value
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblcurrBalValue attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblcurrBalValue attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeRight multiplier:0.9 constant:0]];
 
    //-----available bal caption
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblavalBal attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblavalBal attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
    
    //-----available bal value
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblavalBalValue attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblavalBalValue attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeRight multiplier:0.9 constant:0]];
    
    //-----progress bar
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.25 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.0025 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:progressView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.60 constant:0]];
    
    
    
    
}



/*- (void) drawRect:(CGRect)rect{
 
 CGRect fr = rect;
 fr.size.width = fr.size.width-2*rad;
 fr.size.height = fr.size.height-1;
 fr.origin.x = rad;
 // draw round corners layer
 bglayer = [CALayer layer];
 bglayer.backgroundColor = normalColor.CGColor;
 bglayer.cornerRadius = rad;
 bglayer.frame = fr;
 bglayer.zPosition = -5; // important, otherwise delete button does not fire / is covered
 [self.view.layer addSublayer:bglayer];
 // set label size (adjust to heightForRowAtIndexPath..)
 //label.frame = CGRectMake(rad, 5, fr.size.width, fr.size.height);
 // corner layer top left
 topleft = [CALayer layer];
 topleft.backgroundColor = normalColor.CGColor;
 CGRect tl = CGRectMake(rad, 0, rad, rad);
 topleft.frame = tl;
 topleft.zPosition = -4;
 if(roundTop){
 topleft.hidden = YES;
 }else {
 topleft.hidden = NO;
 }
 [self.view.layer addSublayer:topleft];
 // corner layer top right
 topright = [CALayer layer];
 topright.backgroundColor = normalColor.CGColor;
 topright.frame = CGRectMake(fr.size.width, 0, rad, rad);
 topright.zPosition = -3;
 if(roundTop){
 topright.hidden = YES;
 }
 else {
 topright.hidden = NO;
 }
 [self.view.layer addSublayer:topright];
 // corner layer bottom left
 bottomleft = [CALayer layer];
 bottomleft.backgroundColor = normalColor.CGColor;
 bottomleft.frame = CGRectMake(rad, fr.size.height-rad, rad, rad);
 bottomleft.zPosition = -2;
 if(roundBottom){
 bottomleft.hidden = YES;
 }else {
 bottomleft.hidden = NO;
 }
 [self.view.layer addSublayer:bottomleft];
 // corner layer bottom right
 bottomright = [CALayer layer];
 bottomright.backgroundColor = normalColor.CGColor;
 bottomright.frame = CGRectMake(fr.size.width, fr.size.height-rad, rad, rad);
 bottomright.zPosition = -1;
 if(roundBottom){
 bottomright.hidden = YES;
 }else {
 bottomright.hidden = NO;
 }
 [self.view.layer addSublayer:bottomright];
 //[super drawRect:rect];
 }
 
 -(void) drawRoundTop{
 roundTop = YES;
 topleft.hidden = YES;
 topright.hidden = YES;
 }
 
 -(void) drawRoundBottom{
 roundBottom = YES;
 bottomleft.hidden = YES;
 bottomright.hidden = YES;
 }*/

-(void) displayMessage:(NSError *) error{
    
    UIAlertController * alertController=   [UIAlertController
                                            alertControllerWithTitle:@"message"
                                            message:@"No transacton details found !!!"
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

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//NSDictionary *jsonDictionary = @{
//                                 @"name" : @"customer6",
//                                 @"pass" : @"customer6",
//                                 @"mail" : @"customer6@xy.com",
//                                 
//                                 @"user_roles" : @"5",
//                                 
//                                 @"field_login_pin_value" : @{
//                                         @"und":@[
//                                                 @{
//                                                     @"value" : @"2324"
//                                                     }
//                                                 ]
//                                         }
//                                 };
//
//NSDictionary *o1 = [NSDictionary dictionaryWithObjectsAndKeys:
//                    @"ABCD", @"key1",
//                    @"EFG", @"key2",
//                    nil];
//
//NSDictionary *o2 = [NSDictionary dictionaryWithObjectsAndKeys:
//                    @"XYZ", @"key1",
//                    @"POI", @"key2",
//                    nil];
//
//NSArray *array = [NSArray arrayWithObjects:o1, o2, nil];
//
//NSString *jsonString = [array JSONRepresentation];


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

