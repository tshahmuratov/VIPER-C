//
//  UIViewControllerFactory.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "UIViewControllerFactory.h"
#import "Entity1ViewController.h"
#import "Entity1Interactor.h"
#import "Entity2ViewController.h"

@implementation UIViewControllerFactory

+ (UIViewController*)produceEntity1Controller {
    Entity1Gateway *gateway = [[Entity1Gateway alloc] init];
    Entity1Interactor *interactor = [[Entity1Interactor alloc] initWithGateway:gateway];
    Entity1ViewController *vc = [[Entity1ViewController alloc] initWithInteractor:interactor];
    return vc;
}

+ (UIViewController*)produceEntity2Controller {
    return [[Entity2ViewController alloc] init];
}

@end
