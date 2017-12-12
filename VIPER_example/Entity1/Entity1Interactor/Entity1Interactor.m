//
//  Entity1Interactor.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "Entity1Interactor.h"
#import "Entity1Repository.h"
#import "HTTPService.h"
#import "consts.h"

@interface Entity1Interactor()

@property (readonly, nonnull) id<Entity1GatewayProtocol> gateway;
@property (nullable) Entity1Repository *repository;
@end

@implementation Entity1Interactor

- (instancetype)initWithGateway:(id<Entity1GatewayProtocol>)gateway {
    self = [super init];
    if (self) {
        _gateway = gateway;
    }
    return self;
}

- (void)updateWithSuccessBlock:(void(^)(void))successBlock andErrorBlock:(void(^)(NSError*))errorBlock {
    [self.gateway getListWithSuccessBlock:^(NSURLSessionDataTask *task, id responseObject) {
        if (![HTTPService isSuccessResponse:responseObject]) {
            NSError *error = [NSError errorWithDomain:ERROR_DOMAIN code:123 userInfo:@{NSLocalizedDescriptionKey:[HTTPService getErrorString:responseObject]}];
            errorBlock(error);
            return;
        }
        if (![responseObject[RESPONSE_BLOCK] isKindOfClass:[NSArray class]]) {
            NSError *error = [NSError errorWithDomain:ERROR_DOMAIN code:123 userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"bad_response", @"Bad response")}];
            errorBlock(error);
            return;
        }
        self.repository = [[Entity1Repository alloc] initWithResponse:responseObject[RESPONSE_BLOCK]];
        successBlock();
    } andErrorBlock:^(NSURLSessionDataTask *task, NSError *error) {
        errorBlock(error);
    }];
}

- (Entity1Repository*)getRepository {
    return self.repository;
}

@end
