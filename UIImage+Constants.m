//
//  UIImage+Constants.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 2/7/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import "UIImage+Constants.h"



@implementation UIImageView (Constants)


+(UIImageView *) accessoryImage {
    
    static UIImageView *imageView;
    

    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DetailDisclosureBlue.png"]];

    imageView.backgroundColor=[UIColor grayColor];
    imageView.layer.cornerRadius = roundf(imageView.frame.size.width/2.0);
    imageView.layer.masksToBounds = YES;
    
    return imageView;
}




@end