//
//  AccountsData.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/23/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountsData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *cifNumber;
@property (readonly) NSString *accountNumber;
@property (readonly) NSString *customerName;
@property (readonly) NSString *accountStatus;
@property (readonly) NSString *accountCurrency;
@property (readonly) NSNumber *currentBalance;
@property (readonly) NSNumber *availableBalance;
@property (readonly) NSString *accountType;
@property (readonly) NSString *accountDesc;
@property (readonly) NSString *customerSegment;
@property (readonly) NSString *loanType;
@property (readonly) NSString *loanDesc;
@property (readonly) NSString *loanStatus;
@property (readonly) NSNumber *principalAmount;
@property (readonly) NSString *principalCurrency;
@property (readonly) NSNumber *installmentAmount;
@property (readonly) NSString *installmentCurrency;
@property (readonly) NSNumber *loanCurrentBalance;
@property (readonly) NSNumber *loanOSBalance;
@property (readonly) NSNumber *paidAmount;
@property (readonly) NSNumber *noPendingInstl;
@property (readonly) NSNumber *lastPaidAmount;
@property (readonly) NSNumber *totalInstallments;
@property (readonly) NSNumber *installmentsPaid;
@property (readonly) NSNumber *depositAmount;
@property (readonly) NSNumber *depositTenor;
@property (readonly) NSNumber *depositMaturityAmount;
@property (readonly) NSNumber *recordFound;




@end
