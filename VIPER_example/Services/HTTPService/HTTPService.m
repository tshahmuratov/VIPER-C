//
//  HTTPService.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "HTTPService.h"
#import "consts.h"

@implementation HTTPService

+ (BOOL)isSuccessResponse:responseObject {
    if (![responseObject isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    id status = responseObject[STATUS_BLOCK];
    if (!status || ![status isKindOfClass:[NSString class]]) {
        return NO;
    }
    return [status isEqualToString:SUCCESS_STATUS];
    
}

+ (NSString*) getErrorString:responseObject {
    NSString *defaultHTTPError = NSLocalizedString(@"default_http_error", @"Default http error");
    if (![responseObject isKindOfClass:[NSDictionary class]]) {
        return defaultHTTPError;
    }
    id error = responseObject[ERROR_BLOCK];
    if (!error || ![error isKindOfClass:[NSString class]]) {
        return defaultHTTPError;
    }
    return (NSString*)error;
}

@end
