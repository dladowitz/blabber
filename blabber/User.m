//
//  User.m
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "User.h"

NSString * const UserDidLoginNotification = @"UserDidLoginNotification";
NSString * const UserDidLogoutNotification = @"UserDidLogoutNotification";


@implementation User

static User *currentUser = nil;

+ (User *)currentUser {
    if (currentUser == nil) {
        NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"current_user"];
        
        if (dictionary) {
            currentUser = [[User alloc] initWithDictionary:dictionary];

        }
    } 
    
    return currentUser;
}

+ (void)setCurrentUser:(User *)user {
    if (user) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSJSONSerialization dataWithJSONObject:user.data
                                                                                         options:NSJSONWritingPrettyPrinted
                                                                                           error:nil]
                                                  forKey:@"current_user"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"current_user"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // sets current user. tells someone about it
    if (currentUser == nil && user != nil) {
        currentUser = user;
        [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLoginNotification object:nil];
        NSLog(@"Current user is you! Oh happy day!");
    }
    // resets current user to nil
    else if (currentUser != nil && user == nil) {
        currentUser = user;
        [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLogoutNotification object:nil];
        NSLog(@"No one is the currentUser. But who is no one?");
    }
}


- (User *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    _data = dictionary;
    return self;
}
@end
