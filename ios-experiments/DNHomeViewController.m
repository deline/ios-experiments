//
//  DNHomeViewController.m
//  ios-experiments
//
//  Created by Deline Neo on 10/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNHomeViewController.h"
#import "DNValidatingTableViewCell.h"

@interface DNHomeViewController ()

@property NSMutableArray *fields;

@end

@implementation DNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.fields = [NSMutableArray arrayWithObjects:@"First name", @"Last name", nil];
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


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Section Header";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"homeTableCellIdentifier";

    DNValidatingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSString *fieldName = [self.fields objectAtIndex:indexPath.row];
    cell.title.text = fieldName;
    cell.subtitle.text = @"Required";
    cell.textInput.placeholder = fieldName;

    return cell;
}


@end
