//
//  DNValidatingInputViewController.h
//  ios-experiments
//
//  Created by Deline Neo on 16/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "US2ValidatorTextField.h"

@interface DNValidatingInputViewController : UIViewController <US2ValidatorUIDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet US2ValidatorTextField *firstName;

@end
