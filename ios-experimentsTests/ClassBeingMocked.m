// Created by deline on 1/08/13.
// Copyright (c) 2013 Deline Neo. All rights reserved.


#import "ClassBeingMocked.h"
#import "DNPerson.h"


@implementation ClassBeingMocked {

}
- (void)sayHello:(DNPerson *)person {
    NSLog(@"Person is: %@ %@", person.firstName, person.lastName);
}
@end
