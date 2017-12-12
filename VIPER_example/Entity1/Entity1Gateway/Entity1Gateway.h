//
//  Entity1Gateway.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Entity1Model.h"

typedef void(^SuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void(^ErrorBlock)(NSURLSessionDataTask *task, NSError *error);

@protocol Entity1GatewayProtocol <NSObject>

- (void)getListWithSuccessBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock;
- (void)createEntity1:(Entity1Model*)model successBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock;
- (void)updateEntity1:(Entity1Model*)model successBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock;
- (void)deleteEntity1:(Entity1Model*)model successBlock:(SuccessBlock)successBlock andErrorBlock:(ErrorBlock)errorBlock;

@end


@interface Entity1Gateway : NSObject<Entity1GatewayProtocol>

@end
