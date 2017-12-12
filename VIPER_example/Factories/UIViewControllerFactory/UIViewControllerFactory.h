//
//  UIViewControllerFactory.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface UIViewControllerFactory : NSObject

+ (UIViewController*)produceEntity1Controller;
+ (UIViewController*)produceEntity2Controller;

@end
