//
//  DNActionSheet.m
//  ios-experiments
//
//  Created by Deline Neo on 30/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNActionSheet.h"

@implementation DNActionSheet

- (id)initWithTitle:(NSString *)title delegate:(id <UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    self = [super initWithTitle:title
                       delegate:delegate
              cancelButtonTitle:cancelButtonTitle
         destructiveButtonTitle:destructiveButtonTitle
              otherButtonTitles:otherButtonTitles, nil];
    if (self) {

    }

    NSLog(@"%@", self.subviews);


    return self;
}


@end
