//
//  Tweet.h
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject

@property (nonatomic, strong, readonly) NSString *tweet_id;
@property (nonatomic, strong, readonly) NSString *in_reply_to_status_id;
@property (nonatomic, strong, readonly) NSString *tweet_text;
@property (nonatomic, strong, readonly) NSString *timestamp;
@property (nonatomic, strong, readonly) NSString *profile_image_url;
@property (nonatomic, strong, readonly) NSString *twitter_handle;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *relative_timestamp;


@end
