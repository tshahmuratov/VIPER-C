//
//  Entity1Repository.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "Entity1Repository.h"
#import "Entity1Model.h"

@interface Entity1Repository() <UITableViewDataSource>

@property (nonatomic) NSMutableArray<Entity1Model*> *activeEntities;
@property (nonatomic) NSMutableDictionary<NSString*, NSMutableArray<Entity1Model*>*> *deletedEntitiesByDate;
@property (nonatomic) NSMutableOrderedSet <NSString *>*dates;
@property (copy) GetEntity1CellBlock produceCellBlock;

@end

@implementation Entity1Repository

#pragma mark private

- (void)addActiveEntity:(Entity1Model *)entity {
    [self.activeEntities addObject:entity];
}

- (void)addDeletedEntity:(Entity1Model*)entity {
    if (![self.deletedEntitiesByDate objectForKey:entity.dateAsHumanString]) {
        self.deletedEntitiesByDate[entity.dateAsHumanString] = [[NSMutableArray alloc] init];
    }
    [self.deletedEntitiesByDate[entity.dateAsHumanString] addObject:entity];
    [self.dates addObject:entity.dateAsHumanString];
}

- (Entity1Model*)getDeletedEntityByDatePos:(NSInteger)datePos andRowPos:(NSInteger)rowPos {
    return self.deletedEntitiesByDate[self.dates[datePos]][rowPos];
}

- (Entity1Model*)getEntityByIndexPath:(NSIndexPath*)indexPath {
    if (indexPath.section > 0) {
        NSInteger datePosWithoutActive = indexPath.section - 1;
        return [self getDeletedEntityByDatePos:datePosWithoutActive andRowPos:indexPath.row];
    } else {
        return self.activeEntities[indexPath.row];
    }
}

#pragma mark - public

- (instancetype)initWithResponse:(NSArray*)response {
    self = [super init];
    if (self) {
        self.activeEntities = [[NSMutableArray alloc] init];
        self.deletedEntitiesByDate = [[NSMutableDictionary alloc] init];
        self.dates = [[NSMutableOrderedSet alloc] init];
        for (id element in response) {
            if ([Entity1Model isValidResponse:element]) {
                Entity1Model *model = [[Entity1Model alloc] initFromDictionary:element];
                
                if (model.isDeleted) {
                    [self addDeletedEntity:model];
                } else {
                    [self addActiveEntity:model];
                }
            }
        }
    }
    return self;
}

- (void)setGetCellBlock:(GetEntity1CellBlock)produceCellBlock {
    self.produceCellBlock = produceCellBlock;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dates count] + 1; // add for active one
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) { // active one
        return [self.activeEntities count];
    }
    NSInteger datePosWithoutActive = section - 1;
    NSString *dateKey = self.dates[datePosWithoutActive];
    return [self.deletedEntitiesByDate[dateKey] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return NSLocalizedString(@"active_header", @"Active");
    }
    NSInteger datePosWithoutActive = section - 1;
    return self.dates[datePosWithoutActive];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Entity1Model *entity = [self getEntityByIndexPath:indexPath];
    return self.produceCellBlock(tableView, indexPath, entity);
}

@end
