// Created by deline on 1/08/13.
// Copyright (c) 2013 Deline Neo. All rights reserved.


#import "DNPersonMatcher.h"
#import "DNPerson.h"
#import "HCRequireNonNilObject.h"


@implementation DNPersonMatcher

+ (id)matchesPerson:(DNPerson *)person {
    return [[self alloc] initWithPerson:person];
}

- (id)initWithPerson:(DNPerson *)person {

    HCRequireNonNilObject(person);

    self = [super init];
    if (self) {
        _person = person;
    }

    return self;
}

- (BOOL)matches:(id)item {

    DNPerson *actualPerson = item;

    return [self.person.firstName isEqualToString:actualPerson.firstName] &&
            [self.person.lastName isEqualToString:actualPerson.lastName];
}

//- (BOOL)matches:(id)item describingMismatchTo:(id <HCDescription>)mismatchDescription {
//    return [super matches:item describingMismatchTo:mismatchDescription];
//}

- (void)describeMismatchOf:(id)item to:(id <HCDescription>)mismatchDescription {

    DNPerson *expected = item;
    NSString *descriptionText = [NSString stringWithFormat:@"was person with first name: %@ last name: %@", expected.firstName, expected.lastName];

    [mismatchDescription appendText:descriptionText];
}


- (void)describeTo:(id<HCDescription>)description {

    NSString *descriptionText = [NSString stringWithFormat:@" person with first name: %@ last name: %@", self.person.firstName, self.person.lastName];

    [[description appendText:descriptionText]
            appendText:@" "];
//            appendDescriptionOf:self.person];

}


@end