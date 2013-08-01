// Created by deline on 1/08/13.
// Copyright (c) 2013 Deline Neo. All rights reserved.


#import "DNPerson.h"


@implementation DNPerson

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}


@end