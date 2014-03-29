//
//  User.h
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+ (User *)currentUser;
+ (void)setCurrentUser:(User *)user;

@end
