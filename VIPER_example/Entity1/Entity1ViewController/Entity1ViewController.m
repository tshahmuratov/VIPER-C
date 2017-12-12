//
//  Entity1ViewController.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "Entity1ViewController.h"
#import "Entity1TableViewCell.h"

@interface Entity1ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *entity1Table;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Entity1TableHeightConstraint;
@property (readonly) id<Entity1InteractorProtocol> interactor;
@property (readonly) Entity1Repository* repository;
@end

@implementation Entity1ViewController

- (instancetype)initWithInteractor:(id<Entity1InteractorProtocol>)interactor {
    self = [super init];
    if (self) {
        _interactor = interactor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Class class = [Entity1TableViewCell class];
    [self.entity1Table registerNib:[UINib nibWithNibName:NSStringFromClass(class) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass(class)];
    [self.entity1Table addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    typeof(self) __weak weakSelf = self;
    [self.interactor updateWithSuccessBlock:^{
        if (weakSelf) {
            _repository = [weakSelf.interactor getRepository];
            [weakSelf.repository setGetCellBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath* indexPath, Entity1Model *model) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Entity1TableViewCell class]) forIndexPath:indexPath];
                Entity1TableViewCell *entityCell = (Entity1TableViewCell *)cell;
                return [entityCell initWithModel:model];
            }];
            weakSelf.entity1Table.dataSource = weakSelf.repository;
            [weakSelf.entity1Table reloadData];
        }
    } andErrorBlock:^(NSError *error) {
        NSLog(@"error on load - %@", error);
    }];
    
}

- (void)dealloc {
    [self.entity1Table removeObserver:self forKeyPath:@"contentSize"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    CGFloat height = self.entity1Table.contentSize.height;
    self.Entity1TableHeightConstraint.constant = height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
