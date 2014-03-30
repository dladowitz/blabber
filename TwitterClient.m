
//  TwitterClient.m
//  blabber
//
//  Created by David Ladowitz on 3/28/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "TwitterClient.h"

@implementation TwitterClient

// Creates a singleton for the twitter client
+ (TwitterClient *)instance {
    static TwitterClient *instance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        
        // Creates a singleton of Twitter Client with keys and string for Twitter API
        instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.twitter.com"]
                                              consumerKey:@"cwXZdW7rJLs8ZDUwbOU4Nenbe"
                                           consumerSecret:@"ScLZQFwizF7oH0KQpQeXOTozavJQYgG1ssr33EAKzYB5VllzNZ" ];
    });
    
    return instance;
}

// Does the required authorization steps to login to twitter
- (void)login {
    [self.requestSerializer removeAccessToken];
    
    // Fetches a request token with protocol handler to call back to. Returns a requestToken
    [self fetchRequestTokenWithPath:@"oauth/request_token"
                             method:@"POST"
                        callbackURL:[NSURL URLWithString:@"cptwitter://oauth"]
                              scope:nil success:^(BDBOAuthToken *requestToken) {
                                  
        NSLog(@"Got the Request Token yo!");

        NSLog(@"Its pretty: %@", requestToken.token);
        
        
        // Creates a string URL with the request Token appeneded
        NSString *authURL = [NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token];

        // Goes to the URL to authorize
        // Afterward the call back goes fires application:openURL:sourceApplication:annotation
        NSLog(@"Going to the Twitters to authroize");
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:authURL]];
        
        
    } failure:^(NSError *error) {
        NSLog(@"This Request Token shit is all fucked up: %@", [error description]);
    }];
}

// Pulling tweets from the home timeline api endpoint
// We should probably grab the json, clean it up and return back a bunch of tweet objects. It'll make it nicer to use
- (AFHTTPRequestOperation *)homeTimeLineWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    return [self GET:@"1.1/statuses/home_timeline.json" parameters:nil success:success failure:failure];
}

// Pulls tweets from hometimeline with extra params added
- (void)homeTimelineWithCount:(int)count sinceId:(int)sinceId maxId:(int)maxId success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                                                                               failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"count": @(count)}];
    if (sinceId > 0) {
        [params setObject:@(sinceId) forKey:@"since_id"];
    }
    if (maxId > 0) {
        [params setObject:@(maxId) forKey:@"max_id"];
    }
    [self GET:@"1.1/statuses/home_timeline.json" parameters:params success:success failure:failure];
}


// Getting user object from credtials api endpoint
- (AFHTTPRequestOperation *)getUserWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                       failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    return [self GET:@"1.1/account/verify_credentials.json" parameters:nil success:success failure:failure];
}

// Sending a tweet via the api endpoint
- (void)updateStatus:(NSString *)status success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
   NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject:status forKey:@"status"];
    
    [self POST:@"https://api.twitter.com/1.1/statuses/update.json" parameters:params success:success failure:failure];
}




@end
