//
//  TwitterClient.h
//  blabber
//
//  Created by David Ladowitz on 3/28/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *)instance;

- (void)login;

- (AFHTTPRequestOperation *)homeTimeLineWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)getUserWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (AFHTTPRequestOperation *)mentionsWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


- (AFHTTPRequestOperation *)userTimelineWithScreenName:(NSString *)screenName
                                               success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)homeTimelineWithCount:(int)count sinceId:(int)sinceId maxId:(int)maxId success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                                                                               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)updateStatus:(NSString *)status success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)favoriteWithTweetId:(NSString *)tweetId success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)replyToTweetId:(NSString *)tweetId withStatus:(NSString *) status success:(void (^)(AFHTTPRequestOperation *operation, id response))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)retweetWithTweetId:(NSString *)tweetId success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end