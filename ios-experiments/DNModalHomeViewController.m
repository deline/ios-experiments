//
//  DNModalHomeViewController.m
//  ios-experiments
//
//  Created by Deline Neo on 16/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNModalHomeViewController.h"
#import "US2Validator.h"
#import "US2ConditionAlphabetic.h"
#import "DNAppDelegate.h"

@interface DNModalHomeViewController ()

@end

@implementation DNModalHomeViewController

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


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToModalViewController:(UIStoryboardSegue *)segue {
    //do stuff
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"Did appear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"Did disappear");
}


- (IBAction)clickMe:(UIButton *)sender {

    UIView *modalView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    modalView.opaque = NO;
    modalView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];

    UILabel *label = [[UILabel alloc] init];
    label.text = @"Modal View";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.opaque = NO;
    [label sizeToFit];
    [modalView addSubview:label];

//    [self.view addSubview:modalView];

    DNAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate.window addSubview:modalView];
}

@end
