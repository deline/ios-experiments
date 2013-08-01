//
//  DNMockingTest.m
//  ios-experiments
//
//  Created by Deline Neo on 1/08/13.
//  Copyright (c) 2013 Deline Neo. All rights reserved.
//

#define HC_SHORTHAND
#import "DNMockingTest.h"
#import "ClassUnderTest.h"
#import "ClassBeingMocked.h"
#import "DNPerson.h"
#import <OCMock/OCMock.h>
#import <OCHamcrest.h>

@implementation DNMockingTest {
    ClassUnderTest *test;
    id mock;
}

-(void)setUp {
    mock = [OCMockObject mockForClass:[ClassBeingMocked class]];
    test = [[ClassUnderTest alloc] initWithObject:mock];
}

-(void)testMocking {

    DNPerson *person = [[DNPerson alloc] initWithFirstName:@"Deline" lastName:@"Neo"];

    [[mock expect] sayHello:person];
    [test doSomething];
    [mock verify];
}

@end
