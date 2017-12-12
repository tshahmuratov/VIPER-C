//
//  Entity1Interactor.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity1Gateway.h"
#import "Entity1Repository.h"

@protocol Entity1InteractorProtocol<NSObject>

- (instancetype)initWithGateway:(id<Entity1GatewayProtocol>)gateway;
- (void)updateWithSuccessBlock:(void(^)(void))successBlock andErrorBlock:(void(^)(NSError*))errorBlock;
- (Entity1Repository*)getRepository;

@end

@interface Entity1Interactor : NSObject<Entity1InteractorProtocol>

@end
