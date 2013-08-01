// Created by deline on 1/08/13.
// Copyright (c) 2013 Deline Neo. All rights reserved.


#import <Foundation/Foundation.h>

@class ClassBeingMocked;


@interface ClassUnderTest : NSObject

- (id)initWithObject:(ClassBeingMocked *)object;

- (void)doSomething;
@end
