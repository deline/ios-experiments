// Created by deline on 1/08/13.
// Copyright (c) 2013 Deline Neo. All rights reserved.


#import "ClassUnderTest.h"
#import "ClassBeingMocked.h"
#import "DNPerson.h"

@interface ClassUnderTest()

@property(nonatomic, strong) ClassBeingMocked *object;


@end

@implementation ClassUnderTest

- (id)initWithObject:(ClassBeingMocked *)object {
    self = [super init];
    if (self) {
        _object = object;
    }

    return self;
}

- (void)doSomething {
    DNPerson *person = [[DNPerson alloc] initWithFirstName:@"Deline" lastName:@"Neo"];
    [self.object sayHello:person];
}
@end
