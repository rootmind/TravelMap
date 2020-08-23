//
//  LocationViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 12/26/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <GoogleMaps/GoogleMaps.h>

@interface LocationViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, GMSMapViewDelegate>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;


@property (strong, nonatomic) UITableView *tableViewATM;
@property (strong, nonatomic) UITableView *tableViewBrn;

//@property (strong, nonatomic) NSDictionary *dataDictionary;
//@property (strong, nonatomic) NSMutableArray *creditCardTrnArray;
//@property (strong, nonatomic) NSDictionary *creditCardDataDictionary;
//@property (strong, nonatomic) NSMutableArray *creditCardsArray;
//@property (strong, nonatomic) CreditCardTrnData *creditCardTrn;
//@property (strong, nonatomic) CreditCardsData *creditCards;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;

@property (strong, nonatomic) NSMutableArray *atmCaptionData;
@property (strong, nonatomic) NSMutableArray *atmValueData;

@property (strong, nonatomic) NSMutableArray *brnCaptionData;
@property (strong, nonatomic) NSMutableArray *brnValueData;

@property (strong, nonatomic) UIView *mapHeaderView;


@end