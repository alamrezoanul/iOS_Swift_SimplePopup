//
//  CommonMethodsObjC.m
//  SimplePopupDemo
//
//  Created by TAHIYAH ALAM KHAN on 6/20/17.
//  Copyright © 2017 Rezoanul Alam Riad. All rights reserved.
//


#import "CommonMethodsObjC.h"

@implementation CommonMethodsObjC

- (BOOL) isNULL: (id) value
{
    BOOL result = FALSE;
    if( value == nil )
    {
        result = TRUE;
    }
    else if( [value isKindOfClass:[NSNull class]] )
    {
        result = TRUE;
    }
    else if( [value isKindOfClass:[NSDictionary class]] )
    {
        if( value == [NSNull null] )
        {
            result = TRUE;
        }
    }
    else if( [value isKindOfClass:[NSArray class]] )
    {
        if( value == [NSNull null] )
        {
            result = TRUE;
        }
    }
    else if( [value isKindOfClass:[NSString class]] )
    {
        result = [value isEqualToString:@"<null>"] || [value isEqualToString:@"(null)"];
    }
    
    return  result;
}

@end
