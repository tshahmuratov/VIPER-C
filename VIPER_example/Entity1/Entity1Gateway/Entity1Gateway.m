//
//  Entity1Gateway.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "Entity1Gateway.h"
#import "consts.h"

@implementation Entity1Gateway

// Mocks
- (void)getListWithSuccessBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc] init];
            NSDictionary *responseObject = @{
                                             RESPONSE_BLOCK: @[
                                                     @{
                                                         NAME_KEY: @"name1",
                                                         DATE_KEY: @"2017-12-11T13:34:08.000Z",
                                                         PRICE_KEY: @"10.1",
                                                         IS_DELETED_KEY: [NSNumber numberWithBool:NO]
                                                         },
                                                     
                                                     @{
                                                         NAME_KEY: @"name2",
                                                         DATE_KEY: @"2017-12-11T12:34:08.000Z",
                                                         PRICE_KEY: @"10.1",
                                                         IS_DELETED_KEY: [NSNumber numberWithBool:YES]
                                                         },
                                                     
                                                     @{
                                                         NAME_KEY: @"name3",
                                                         DATE_KEY: @"2017-12-10T13:34:08.000Z",
                                                         PRICE_KEY: @"20.1",
                                                         IS_DELETED_KEY: [NSNumber numberWithBool:YES]
                                                         }
                                                     ],
                                             STATUS_BLOCK: SUCCESS_STATUS,
                                             };
            successBlock(task, (id)responseObject);
    });
}

- (void)createEntity1:(Entity1Model*)model successBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc] init];
        NSDictionary *responseObject = @{
                                         RESPONSE_BLOCK:
                                             @{
                                                 NAME_KEY: model.name,
                                                 DATE_KEY: model.dateAsString,
                                                 PRICE_KEY: model.price,
                                                 IS_DELETED_KEY: [NSNumber numberWithBool:model.isDeleted],
                                                 },
                                         STATUS_BLOCK: SUCCESS_STATUS,
                                         };
        ;
        successBlock(task, responseObject);
    });
}

- (void)updateEntity1:(Entity1Model*)model successBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc] init];
        NSDictionary *responseObject = @{
                                         RESPONSE_BLOCK:
                                             @{
                                                 NAME_KEY: model.name,
                                                 DATE_KEY: model.dateAsString,
                                                 PRICE_KEY: model.price,
                                                 IS_DELETED_KEY: [NSNumber numberWithBool:model.isDeleted]
                                                 },
                                         STATUS_BLOCK: SUCCESS_STATUS,
                                         };
        ;
        successBlock(task, responseObject);
    });
}

- (void)deleteEntity1:(Entity1Model*)model successBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc] init];
        NSDictionary *responseObject = @{
                                         RESPONSE_BLOCK: @"",
                                         STATUS_BLOCK: SUCCESS_STATUS,
                                         };
        ;
        successBlock(task, responseObject);
    });
}

@end
