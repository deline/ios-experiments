//
//  DNActivity.m
//  ios-experiments
//
//  Created by Deline Neo on 30/07/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#import "DNActivity.h"

@implementation DNActivity

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"image_icon_valid.png"];
}

- (NSString *)activityTitle {
    return @"ABC";
}

- (NSString *)activityType {
    return @"XYZ";
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
//    return [super canPerformWithActivityItems:activityItems];
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    [super prepareWithActivityItems:activityItems];
}


@end
