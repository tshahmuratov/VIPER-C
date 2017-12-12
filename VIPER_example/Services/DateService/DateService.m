//
//  DateService.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "DateService.h"

@implementation DateService

+ (NSDateFormatter*)getRFC3339Formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.000Z'"]; // RFC 3339
    return dateFormatter;
}

+ (NSString*)getDateAsHumanText: (NSDate*)date {
    NSString *languageID = [[NSBundle mainBundle] preferredLocalizations].firstObject;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:languageID]];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateFormat:@"dd MMMM"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString*) dateToRFC3339String:(NSDate*)date {
    return [[DateService getRFC3339Formatter] stringFromDate:date];
}

+ (NSDate*) RFC3339StringToDate:(NSString*)dateString {
   return [[DateService getRFC3339Formatter] dateFromString:dateString];
}

@end
