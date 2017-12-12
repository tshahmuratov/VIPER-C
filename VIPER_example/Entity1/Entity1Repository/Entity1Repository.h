//
//  Entity1Repository.h
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Entity1Model.h"

typedef UITableViewCell*(^GetEntity1CellBlock)(UITableView*, NSIndexPath*, Entity1Model*);

@interface Entity1Repository : NSObject<UITableViewDataSource>

- (instancetype)initWithResponse:(NSArray*)response;
- (void)setGetCellBlock:(GetEntity1CellBlock)getCellBlock;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
