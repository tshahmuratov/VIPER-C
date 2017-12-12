//
//  HTTPService.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPService : NSObject

+ (BOOL)isSuccessResponse:responseObject;
+ (NSString*) getErrorString:responseObject;

@end
