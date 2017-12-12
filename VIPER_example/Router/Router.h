//
//  Router.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Router : NSObject<UITabBarControllerDelegate>

@property (readonly, nonnull) UITabBarController* tabBarController;

+ (nullable instancetype)sharedInstance;

- (void)reset;
- (void)resetHelper;


@end
