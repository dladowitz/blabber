//
//  AppDelegate.m
//  blabber
//
//  Created by David Ladowitz on 3/27/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TwitterClient.h"
#import "User.h"
#import "TimelineViewController.h"
#import "MenuViewController.h"

@implementation NSURL (dictionaryFromQueryString)

- (NSDictionary *)dictionaryFromQueryString
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    NSArray *pairs = [[self query] componentsSeparatedByString:@"&"];
    
    for(NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dictionary setObject:val forKey:key];
    }
    
    return dictionary;
}

@end

@interface AppDelegate ()

- (void)updateRootViewController;

@property (nonatomic, strong) LoginViewController *loginViewController;
@property (nonatomic, strong) UINavigationController *timelineViewController;
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) UINavigationController *menuViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    // Sets the root view controller
    [self.window setRootViewController:self.currentViewController];
    
    [self.window makeKeyAndVisible];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateRootViewController) name:UserDidLoginNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateRootViewController) name:UserDidLogoutNotification object:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


// Fires when the app is called from a URL
// Generally from the callback of [TwitterClient login]
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    // Checks the protocol handler
    if ([url.scheme isEqualToString:@"cptwitter"])
    {
        // Checks the route of the handler
        if ([url.host isEqualToString:@"oauth"])
        {
            // Create dictionaty from params in url string
            NSDictionary *parameters = [url dictionaryFromQueryString];
            if (parameters[@"oauth_token"] && parameters[@"oauth_verifier"]) {
                
                
                // Out singleton friend
                TwitterClient *client = [TwitterClient instance];
                
                // Requests access token using a request token
                [client fetchAccessTokenWithPath:@"/oauth/access_token" method:@"POST" requestToken:[BDBOAuthToken tokenWithQueryString:url.query] success:^(BDBOAuthToken *accessToken) {
                    NSLog(@"You got an Access token, yes you did");
                    NSLog(@"Your Access token is so nice: %@", accessToken);
                    [client.requestSerializer saveAccessToken:accessToken];
                    
                    // Goes to credentials endpoint and gets a json user object
                    [client getUserWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {

                        // Using json object to create local user
                        [User setCurrentUser:[[User alloc] initWithDictionary:responseObject]];
                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                        NSLog(@"That user hates you. It took it's ball and went home");
                    }];
                    
                    
                } failure:^(NSError *error) {
                    NSLog(@"You shall not pass! (without an access token)");
                }];
            }
        }
        return YES;
    }
    return NO;
}

// Sets root view controller
- (void)updateRootViewController {
    
    [self.window setRootViewController:self.currentViewController];
}

- (LoginViewController *)loginViewController {
    if (!_loginViewController) {
        _loginViewController = [[LoginViewController alloc] init];
    }
    return _loginViewController;
}

- (UINavigationController *)timelineViewController {
    if (!_timelineViewController) {
        TimelineViewController *timelineVC = [[TimelineViewController alloc] init];
        _timelineViewController = [[UINavigationController alloc] initWithRootViewController:timelineVC];
    }
    // Set the background and shadow image to get rid of the line.
//    _timelineViewController.navigationBar.barTintColor = [UIColor colorWithRed:(14/255.0) green:(172/255.0) blue:(255/255.0) alpha:1];
//    _timelineViewController.navigationBar.tintColor = [UIColor whiteColor]; // sets text color
//    _timelineViewController.navigationBar.shadowImage = [[UIImage alloc] init];
//    
//    for (UIView *view in [[[_timelineViewController.navigationBar subviews] objectAtIndex:0] subviews]) {
//        if ([view isKindOfClass:[UIImageView class]]) view.hidden = YES;
//    }
    
    return _timelineViewController;
}

- (UINavigationController *)menuViewController {
    if (!_menuViewController) {
        MenuViewController *menuVC = [[MenuViewController alloc] init];
        _menuViewController = [[UINavigationController alloc] initWithRootViewController:menuVC];
    }
    // Set the background and shadow image to get rid of the line.
//    _timelineViewController.navigationBar.barTintColor = [UIColor colorWithRed:(14/255.0) green:(172/255.0) blue:(255/255.0) alpha:1];
//    _timelineViewController.navigationBar.tintColor = [UIColor whiteColor]; // sets text color
//    _timelineViewController.navigationBar.shadowImage = [[UIImage alloc] init];
//    
//    for (UIView *view in [[[_timelineViewController.navigationBar subviews] objectAtIndex:0] subviews]) {
//        if ([view isKindOfClass:[UIImageView class]]) view.hidden = YES;
//    }
    
    return _menuViewController;
}

- (UIViewController *)currentViewController {
    if ([User currentUser]) {
        return self.menuViewController;
    }
    else {
        return self.loginViewController;
    }
}

@end
