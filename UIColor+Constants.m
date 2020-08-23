//
//  Constants.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 2/7/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Constants.h"

//@interface UIColor(Constants)
//
//
//@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

@implementation UIColor (Constants)


+(UIColor *) borderColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
        color = [UIColor grayColor];
    //});
    
    return color;
}

+(UIColor *) controllerBGColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
        color = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];
    //color = [UIColor colorWithRed:63/255.0 green:219/255.0 blue:243/255.0 alpha:0.55];
        //color = [UIColor colorWithHue:188/255 saturation:0.88 brightness:0.6 alpha:0.55];
    
    //});
    
    return color;
    
}

+(UIColor *) captionColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
        color = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0];
    //});
    
    return color;
}

+(UIColor *) dataColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
        color = [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];
    //});
    
    return color;
}

+(UIColor *) borderBlueColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
        color = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0];
    //});
    
    return color;
}


+(UIColor *) navigatorColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
        color = [UIColor colorWithRed:0/255.0 green:56/255.0 blue:103/255.0 alpha:1];
    //});
    
    return color;
}

+(UIColor *) cellBGColor {
    
    static UIColor *color;
    
    //static dispatch_once_t onceToken;
    
    //dispatch_once(&onceToken, ^{
    color = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];
    //});
    
    return color;
}

@end

