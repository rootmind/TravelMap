//
//  SingletonClass.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 1/26/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SigletonClass : NSObject
{
    //declare instance variable
    
   NSString *hostServerURL;
   NSString *deviceToken;
   NSString *wifiEnabled;

    
}
+ (id)sharedSingletonClass;



@end
