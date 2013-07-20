//
//  DNValidatingTableViewCell.m
//  ios-experiments
//
//  Created by Deline Neo on 16/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNValidatingTableViewCell.h"
#import "US2ValidatorTextField.h"

@interface DNValidatingTableViewCell ()

@end

@implementation DNValidatingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateStatus:(DNValidatingTableViewCellStatus)status {

    UIImage *icon;
    switch (status) {
        case DNValidatingTableViewCellPendingInput:
            break;
        case DNValidatingTableViewCellStatusInvalid:
            icon = [UIImage imageNamed:@"image_icon_invalid.png"];
            break;
        case DNValidatingTableViewCellStatusValid:
            icon = [UIImage imageNamed:@"image_icon_valid.png"];
            break;
    }

    self.button.imageView.image = icon;
}
@end
