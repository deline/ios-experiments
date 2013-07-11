//
//  DNHomeViewController.m
//  ios-experiments
//
//  Created by Deline Neo on 10/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNHomeViewController.h"
#import "DNTableViewCell.h"

@interface DNHomeViewController ()

@end

@implementation DNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"homeTableCellIdentifier";

    DNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[DNTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.label.text = @"This is the label";
    cell.textField.text = @"This is the input";    
 
    return cell;
}


@end
