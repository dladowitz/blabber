//
//  User.m
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "User.h"

@implementation User

static User *currentUser = nil;

+ (User *)currentUser {
    if (currentUser == nil) {
        NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"current_user"];
        

        if (dictionary) {
            currentUser = [[User alloc] init];
            // need to create initWithDictionary method
            // currentUser = [[User alloc] initWithDictionary:dictionary];

        }
    } 
    
    return currentUser;
}

+ (void)setCurrentUser:(User *)user {
    currentUser = user;
    
    // Save to user defaults
}

@end
