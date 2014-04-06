//
//  User.h
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const UserDidLoginNotification;
extern NSString *const UserDidLogoutNotification;

@interface User : NSObject

@property (nonatomic, strong) NSDictionary *data;


@property (nonatomic, strong)  NSNumber *followerCount;
@property (nonatomic, strong)  NSNumber *friendCount;
@property (nonatomic, strong)  NSNumber *statusCount;
@property (nonatomic, strong)  NSString *profile_image_url;
@property (nonatomic, strong)  NSString *profileBackgroundImageURL;
@property (nonatomic, strong)  NSString *screen_name;
@property (nonatomic, strong)  NSString *name;


+ (User *)currentUser;
+ (void)setCurrentUser:(User *)user;
- (User *)initWithDictionary:(NSDictionary *)dictionary;



@end
