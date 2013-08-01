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
#import "DNPersonMatcher.h"
#import "DNPerson.h"
#import <OCMock/OCMock.h>
#import <OCHamcrest.h>
#import <objc/runtime.h>


@implementation DNPerson(Category)

- (NSString *)description {
//    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    NSMutableString * result = [NSMutableString string];

    // Find Out something about super Classes
    Class classType = [DNPerson class];
    Class superClass  = class_getSuperclass(classType);
    if  ( superClass != nil && ![superClass isEqual:[NSObject class]])
    {
        // Append all the super class's properties to the result (Reqursive, until NSObject)
//        [result appendString:[self autoDescriptionForClassType:superClass]];
    }

    // Add Information about Current Properties
    NSUInteger		  property_count;
    objc_property_t * property_list = class_copyPropertyList(classType, &property_count); // Must Free, later

    for (int i = property_count - 1; i >= 0; --i) { // Reverse order, to get Properties in order they were defined
        objc_property_t property = property_list[i];

        // For Eeach property we are loading its name
        const char * property_name = property_getName(property);

        NSString * propertyName = [NSString stringWithCString:property_name encoding:NSASCIIStringEncoding];
        if (propertyName) { // and if name is ok, we are getting value using KVC
            id value = [self valueForKey:propertyName];

            // format of result items: p1 = v1; p2 = v2; ...
            [result appendFormat:@"%@ = %@; ", propertyName, value];
        }
    }
    free(property_list);//Clean up

    return result;
}


@end

@implementation DNMockingTest {
    ClassUnderTest *test;
    id mock;
}

-(void)setUp {
    mock = [OCMockObject mockForClass:[ClassBeingMocked class]];
    test = [[ClassUnderTest alloc] initWithObject:mock];
}

-(void)testMockingWithMatcher {

    DNPerson *person = [[DNPerson alloc] initWithFirstName:@"Wrong" lastName:@"Neo"];

    NSLog(@"**** %@", [person description]);

    [[mock expect] sayHello:[DNPersonMatcher matchesPerson:person]];
    [test doSomething];
    [mock verify];
}

-(void)testMockingWithBlockAndMatcher {

    DNPerson *expected = [[DNPerson alloc] initWithFirstName:@"Wrong" lastName:@"Neo"];

    [[mock expect] sayHello:[OCMArg checkWithBlock:^BOOL(id actual) {
//        assertThat(actual, [DNPersonMatcher matchesPerson:expected]);
//        return YES;
        return [[DNPersonMatcher matchesPerson:expected] matches:actual];
    }]];

    [test doSomething];
    [mock verify];
}

-(void)testMockingWithConstraintSelectorAndMatcher {

    DNPerson *expected = [[DNPerson alloc] initWithFirstName:@"Wrong" lastName:@"Neo"];

//    [[mock expect] sayHello:expected];
    [[mock expect] sayHello:[OCMConstraint constraintWithSelector:@selector(mySelector:expected:) onObject:self withValue:expected]];

    [test doSomething];
    [mock verify];
}

-(void)testMatcher {
    DNPerson *actual = [[DNPerson alloc] initWithFirstName:@"Deline" lastName:@"Neo"];
    DNPerson *expected = [[DNPerson alloc] initWithFirstName:@"Wrong" lastName:@"Neo"];

    assertThat(actual, [DNPersonMatcher matchesPerson:expected]);

}

-(BOOL)mySelector:(id)actual expected:(id)expected {

    DNPerson *p = actual;
    DNPerson *p2 = expected;

//    assertThat(p, [DNPersonMatcher matchesPerson:expected]);
//    return YES;

    HCBaseMatcher * matcher = [DNPersonMatcher matchesPerson:expected];
    return [matcher matches:actual];
}

@end
