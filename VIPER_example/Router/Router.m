//
//  Router.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "Router.h"
#import "NavControllerFactory.h"

@interface Router()


@property (readonly, nonnull) NSArray<UINavigationController *>*navControllers;

@end

@implementation Router


+(instancetype)sharedInstance {
    static Router *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Router alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        _tabBarController = [[UITabBarController alloc] init];
        _navControllers = [NavControllerFactory produceNavControllers];
        self.tabBarController.viewControllers = [NavControllerFactory produceNavControllers];
        self.tabBarController.delegate = self;
        self.tabBarController.tabBar.translucent = NO; // http://stackoverflow.com/questions/19720216/ios7-uitabbar-will-hide-the-last-cell-of-the-uitableview
    }
    return self;
}

- (void)resetHelper {
    [self.tabBarController dismissViewControllerAnimated:NO completion:nil];
    for (UIViewController* vc in self.tabBarController.viewControllers) {
        if ([vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController* navVC = (UINavigationController*)vc;
            [navVC popToRootViewControllerAnimated:NO];
        }
    }
}

-(void)reset {
    [self resetHelper];
    self.tabBarController.selectedIndex = 0;
}

@end
