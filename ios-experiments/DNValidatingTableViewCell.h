//
//  DNValidatingTableViewCell.h
//  ios-experiments
//
//  Created by Deline Neo on 16/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "US2ValidatorTextField.h"

@interface DNValidatingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet US2ValidatorTextField *textInput;

@end
