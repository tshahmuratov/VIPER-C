//
//  Entity1TableViewCell.m
//  VIPER_example
//
//  Created by Timur.Shahmuratov on 12.12.2017.
//  Copyright © 2017 Timur.Shahmuratov. All rights reserved.
//

#import "Entity1TableViewCell.h"

@interface Entity1TableViewCell()

@property (readonly) Entity1Model *model;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation Entity1TableViewCell

- (instancetype)initWithModel:(Entity1Model*)model {
    self = [super init];
    if (self) {
        _model = model;
        self.nameLabel.text = self.model.name;
        self.priceLabel.text = [NSString stringWithFormat:@"%@", self.model.price];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
