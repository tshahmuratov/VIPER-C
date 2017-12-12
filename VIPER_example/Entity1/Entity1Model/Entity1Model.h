//
//  Entity1Model.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity1Model : NSObject

@property NSString *name;
@property NSDate *date;
@property (readonly, getter=getDateAsString) NSString *dateAsString;
@property (readonly, getter=getDateAsHumanString) NSString *dateAsHumanString;
@property NSNumber *price;
@property BOOL isDeleted;

-(instancetype) initFromDictionary: (NSDictionary*)params;
+(BOOL) isValidResponse:response;

@end
