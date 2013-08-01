// Created by deline on 1/08/13.
// Copyright (c) 2013 Deline Neo. All rights reserved.


#import <Foundation/Foundation.h>
#import "HCBaseMatcher.h"

@class DNPerson;


@interface DNPersonMatcher : HCBaseMatcher

@property DNPerson *person;

- (id)initWithPerson:(DNPerson *)person;

+ (id)matchesPerson:(DNPerson *)person;

@end