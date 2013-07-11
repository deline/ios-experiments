//
//  DNTableViewCell.h
//  ios-experiments
//
//  Created by Deline Neo on 11/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DNTableViewCell : UITableViewCell<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
