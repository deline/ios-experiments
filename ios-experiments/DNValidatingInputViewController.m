//
//  DNValidatingInputViewController.m
//  ios-experiments
//
//  Created by Deline Neo on 16/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNValidatingInputViewController.h"
#import "US2Validator.h"
#import "US2ConditionAlphabetic.h"

@interface DNValidatingInputViewController ()

@end

@implementation DNValidatingInputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.


    US2Validator *validator = [US2Validator new];
    US2ConditionAlphabetic *condition = [US2ConditionAlphabetic new];
    [validator addCondition:condition];

    self.firstName.validator = validator;
    self.firstName.shouldAllowViolations = YES;
    self.firstName.validateOnFocusLossOnly = NO;
    self.firstName.placeholder  = @"Enter first name";
    self.firstName.validatorUIDelegate = self;

//    [self.textFields addObject:self.firstName];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - validator delegate
- (void)validatorUI:(id <US2ValidatorUIProtocol>)validatorUI violatedConditions:(US2ConditionCollection *)conditions {
    NSLog(@"**** %@", conditions);
}


#pragma mark - text field delegates
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
