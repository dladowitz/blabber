//
//  User.h
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const UserDidLoginNotification;
extern NSString *const UserdidLogoutNotification;

@interface User : NSObject

@property (nonatomic, strong) NSDictionary *data;

+ (User *)currentUser;
+ (void)setCurrentUser:(User *)user;
- (User *)initWithDictionary:(NSDictionary *)dictionary;



@end
