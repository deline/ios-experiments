//
//  DNTabBarController.m
//  ios-experiments
//
//  Created by Deline Neo on 30/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNTabBarController.h"
#import "DNActivity.h"
#import "QuartzCore/QuartzCore.h"

@interface DNTabBarController ()

@end

@implementation DNTabBarController

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

    self.delegate = self;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"***%d", tabBarController.selectedIndex);

    if (tabBarController.selectedIndex == 2) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Title"
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Button 1", @"Button2", nil];

        NSLog(@"%@", NSStringFromCGRect(actionSheet.frame));

//        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithFrame:self.view.frame];
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [btn setTitle:@"HI" forState:UIControlStateNormal];
//        btn.frame = CGRectMake(0, 0, 50, 50);
//        [actionSheet addSubview:btn];

        tabBarController.tabBar.hidden = YES;

        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        actionSheet.backgroundColor = [UIColor redColor];

//        [actionSheet showFromTabBar:tabBarController.tabBar];

        [actionSheet showInView:self.view];

        tabBarController.tabBar.hidden = NO;
        NSLog(@"%@", actionSheet.subviews);
    }
    if (tabBarController.selectedIndex == 1) {
        NSArray *activityItems = [NSArray arrayWithObjects:@"X", nil];

        NSArray *applicationActivities = @[
            [DNActivity new]
        ];
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                                        applicationActivities:applicationActivities];



        [self presentViewController:activityViewController animated:YES completion:nil];

    }
}


- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    actionSheet.opaque = NO;
    actionSheet.backgroundColor = [UIColor redColor];


}


@end
