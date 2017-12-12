//
//  Entity1ViewController.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entity1Interactor.h"

@interface Entity1ViewController : UIViewController

- (instancetype)initWithInteractor:(id<Entity1InteractorProtocol>)interactor;

@end
