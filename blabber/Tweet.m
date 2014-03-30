//
//  Tweet.m
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (id)initWithDictionary:(NSDictionary *)dictionary

{
    
    self = [super init];
    if (self) {
        self.tweet_id           = dictionary[@"id"];
        self.tweet_text         = dictionary[@"text"];
        self.profile_image_url  = dictionary[@"profile_image_url"];
        self.twitter_handle     = dictionary[@"screen_name"];
        self.name               = dictionary[@"name"];
        self.timestamp          = dictionary[@"created_at"];
    }
    return self;
}


+ (NSMutableArray *)tweetsWithArray:(NSArray *)array
{
    NSLog(@"Starting tweetsWithArray");
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    
    for (NSDictionary *dictionary in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:dictionary]];
    }
    
    return tweets;
}

@end
