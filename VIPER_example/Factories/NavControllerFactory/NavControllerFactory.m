//
//  NavControllerFactory.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "NavControllerFactory.h"
#import "UIViewControllerFactory.h"

@interface NavControllerFactory()
+ (UINavigationController*)produceEntity1Controller;
+ (UINavigationController*)produceEntity2Controller;
@end

@implementation NavControllerFactory

+ (UINavigationController*)produceEntity1Controller {
    UIViewController *entity1Controller = [UIViewControllerFactory produceEntity1Controller];
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:entity1Controller];
    navController.navigationBar.translucent = NO;
    navController.tabBarItem.title = NSLocalizedString(@"entity1_title", @"Entity1");
    navController.tabBarItem.image = [UIImage imageNamed:@"first"];
    return navController;
}

+ (UINavigationController*)produceEntity2Controller {
    UIViewController *entity2Controller = [UIViewControllerFactory produceEntity2Controller];
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:entity2Controller];
    navController.navigationBar.translucent = NO;
    navController.tabBarItem.title = NSLocalizedString(@"entity2_title", @"Entity2");
    navController.tabBarItem.image = [UIImage imageNamed:@"second"];
    return navController;
}

+ (NSArray<UINavigationController*>*)produceNavControllers {
    NSMutableArray<UINavigationController*>* navArray = [[NSMutableArray alloc] init];
    [navArray addObject:[NavControllerFactory produceEntity1Controller]];
    [navArray addObject:[NavControllerFactory produceEntity2Controller]];
    return navArray;
}

@end
