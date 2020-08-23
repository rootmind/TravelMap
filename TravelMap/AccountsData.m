//
//  AccountsData.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/23/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import "AccountsData.h"

@implementation AccountsData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _accountNumber = [jsonDictionary objectForKey:@"accountNumber"];
        _customerName = [jsonDictionary objectForKey:@"customerName"];
        _accountStatus = [jsonDictionary objectForKey:@"accountStatus"];
        _accountCurrency = [jsonDictionary objectForKey:@"accountCurrency"];
        _currentBalance = [jsonDictionary objectForKey:@"currentBalance"];
        _availableBalance = [jsonDictionary objectForKey:@"availableBalance"];
        _accountType = [jsonDictionary objectForKey:@"accountType"];
        _accountDesc = [jsonDictionary objectForKey:@"accountDesc"];
        _customerSegment = [jsonDictionary objectForKey:@"customerSegment"];
        _loanType = [jsonDictionary objectForKey:@"loanType"];
        _loanDesc = [jsonDictionary objectForKey:@"loanDesc"];
        _loanStatus = [jsonDictionary objectForKey:@"loanStatus"];
        _principalAmount = [jsonDictionary objectForKey:@"principalAmount"];
        _principalCurrency = [jsonDictionary objectForKey:@"principalCurrency"];
        _installmentAmount = [jsonDictionary objectForKey:@"installmentAmount"];
        _installmentCurrency = [jsonDictionary objectForKey:@"installmentCurrency"];
        _loanCurrentBalance = [jsonDictionary objectForKey:@"loanCurrentBalance"];
        _loanOSBalance = [jsonDictionary objectForKey:@"loanOSBalance"];
        _paidAmount = [jsonDictionary objectForKey:@"paidAmount"];
        _noPendingInstl = [jsonDictionary objectForKey:@"noPendingInstl"];
        _lastPaidAmount = [jsonDictionary objectForKey:@"lastPaidAmount"];
        _installmentsPaid = [jsonDictionary objectForKey:@"installmentsPaid"];
        _depositAmount = [jsonDictionary objectForKey:@"depositAmount"];
        _depositTenor = [jsonDictionary objectForKey:@"depositTenor"];
        _depositMaturityAmount = [jsonDictionary objectForKey:@"depositMaturityAmount"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
    
    }
    
    return self;
}

@end
