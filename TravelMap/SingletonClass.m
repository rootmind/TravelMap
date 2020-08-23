//
//  SingletonClass.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 1/26/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonClass.h"

@implementation SigletonClass

+ (id)sharedSingletonClass {
    
    static SigletonClass *sharedClass = nil;
    
    static dispatch_once_t onceToken;//The way we ensure that it’s only created once is by using the dispatch_once method from Grand Central Dispatch (GCD).
    
    dispatch_once(&onceToken, ^{
        sharedClass = [[self alloc] init];
    });
    
    return sharedClass;
}

- (id)init {
    if (self = [super init]) {
        //init instance variable
        
//        if([wifiEnabled isEqualToString:@"YES"])
//        {
//            hostServerURL=@"http://192.168.2.10:8081";
//        }
//        else
//        {
//            hostServerURL=@"http://86.99.90.124:8081";
//        }
        
        hostServerURL=@"http://192.168.2.10:8081";
        //hostServerURL=@"http://86.99.90.124:8081";
        
    
        
    }
    return self;
}


@end