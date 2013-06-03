//
//  FontIcon.m
//  
//
//  Created by Sebastien on 5/15/13.
//  Copyright (c) 2013 Sebastien. All rights reserved.
//

#import "IcoMoon.h"


@implementation IcoMoon

+(NSString *)iconString:(char *)icon
{
    NSString *string = [NSString stringWithUTF8String:icon];
    return string;
}

@end
