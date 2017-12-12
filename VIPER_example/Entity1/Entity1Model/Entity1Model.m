//
//  Entity1Model.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "Entity1Model.h"
#import "DateService.h"
#import "consts.h"

@implementation Entity1Model

- (NSString*)getDateAsString {
    NSString *result = [DateService dateToRFC3339String:self.date];
    if (!result) {
        result = @"";
    }
    return result;
}

- (NSString*)getDateAsHumanString {
    NSString *result = [DateService getDateAsHumanText:self.date];
    if (!result) {
        result = @"";
    }
    return result;
}


-(instancetype) initFromDictionary: (NSDictionary*)params {
    self = [super init];
    if (self) {
        self.name = params[NAME_KEY];
        self.date = [DateService RFC3339StringToDate:params[DATE_KEY]];
        self.price = params[PRICE_KEY];
        self.isDeleted = [params[IS_DELETED_KEY] boolValue];
    }
    return self;
}

+(BOOL) isValidResponse:response {
    if (![response isKindOfClass:[NSDictionary class]]) {
        return NO;
    }
    for (NSString *paramName in REQUIRED_PARAMS) {
        if (!response[paramName]) {
            return NO;
        }
    }
    return YES;
}

@end
