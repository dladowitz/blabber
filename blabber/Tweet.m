//
//  Tweet.m
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "Tweet.h"
#import <NSDate+TimeAgo.h>


@implementation Tweet

- (id)initWithDictionary:(NSDictionary *)dictionary

{
    
    self = [super init];
    if (self) {
        self.tweet_id               = dictionary[@"id"];
        self.tweet_text             = dictionary[@"text"];
        self.profile_image_url      = dictionary[@"user"][@"profile_image_url"];
        self.twitter_handle         = dictionary[@"user"][@"screen_name"];
        self.name                   = dictionary[@"user"][@"name"];
        self.timestamp              = dictionary[@"created_at"];
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
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

-(NSString *)relative_timestamp
{
    NSDateFormatter *datefformat = [[NSDateFormatter alloc] init];
    [datefformat setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    [datefformat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *tweetDate = [datefformat dateFromString:self.timestamp];
    return [tweetDate timeAgo];
}

@end
