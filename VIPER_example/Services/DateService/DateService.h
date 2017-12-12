//
//  DateService.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateService : NSObject

+ (NSString*)getDateAsHumanText: (NSDate*)date;
+ (NSString*) dateToRFC3339String:(NSDate*)date;
+ (NSDate*) RFC3339StringToDate:(NSString*)dateString;

@end
