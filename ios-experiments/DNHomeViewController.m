//
//  DNHomeViewController.m
//  ios-experiments
//
//  Created by Deline Neo on 10/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNHomeViewController.h"
#import "DNValidatingTableViewCell.h"
#import "US2Validator.h"
#import "US2ConditionAlphabetic.h"

@interface DNHomeViewController ()

@property NSMutableArray *fields;

@end

@implementation DNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.fields = [NSMutableArray arrayWithObjects:@"First name", @"Last name", nil];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fields count];
}


//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"Section Header";
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    US2Validator *alphabeticValidator = [US2Validator new];
    US2ConditionAlphabetic *condition = [US2ConditionAlphabetic new];
    [alphabeticValidator addCondition:condition];


    NSString *field = [self.fields objectAtIndex:indexPath.row];
    return [self validatingTableViewCellForTableView:tableView
                                            forField:field
                                       withValidator:alphabeticValidator];
}

- (UITableViewCell *)validatingTableViewCellForTableView:(UITableView *)tableView forField:(NSString *)field withValidator:(US2Validator *)validator {
    static NSString *cellIdentifier = @"homeTableCellIdentifier";
    DNValidatingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.title.text = field;
    cell.subtitle.text = @"Required";
    cell.textInput.placeholder = field;
    cell.textInput.validator = validator;
    cell.textInput.validatorUIDelegate = self;

    return cell;
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



#pragma mark - US2Validator delegate

- (void)validatorUIDidChange:(id <US2ValidatorUIProtocol>)validatorUI {
}

- (void)validatorUI:(id <US2ValidatorUIProtocol>)validatorUI changedValidState:(BOOL)isValid {
    UIView *view = (UIView *)validatorUI;
    DNValidatingTableViewCell *cell = (DNValidatingTableViewCell *)view.superview.superview;


    DNValidatingTableViewCellStatus status = isValid ? DNValidatingTableViewCellStatusValid : DNValidatingTableViewCellStatusInvalid;
    [cell updateStatus:status];
}

- (void)validatorUI:(id <US2ValidatorUIProtocol>)validatorUI violatedConditions:(US2ConditionCollection *)conditions {
    NSLog(@"***** violated conditions: %@", conditions);
}


@end
