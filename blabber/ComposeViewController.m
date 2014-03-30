//
//  ComposeViewController.m
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "ComposeViewController.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"
#import "TwitterClient.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

@synthesize in_reply_to_status_id;
@synthesize current_status;

-(id)initWithNibName:(NSString *)nibNameOrNil andStatus:(NSString *)status bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.current_status = status;
    }
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil andStatus:(NSString *)status inReplyToTweetId:(NSString *)tweetId bundle:(NSBundle *)nibBundleOrNil {
    self = [self initWithNibName:nibNameOrNil andStatus:status bundle:nibBundleOrNil];
    if (self) {
        self.in_reply_to_status_id = tweetId;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Adding Buttons to Navigation Bar
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancelButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDoneButton)];
    self.editing = YES;
    
    if (self.current_status.length == 0) {
        self.statusTextView.text = @"Enter your tweet here";
    }
    else {
        self.statusTextView.text = self.current_status;
    }
    
//    [self.profileImageView setImageWithURL:[NSURL URLWithString: [[User currentUser] profile_image_url]]];
//    self.screenNameLabel.text = [[User currentUser] screen_name];
//    self.nameLabel.text = [[User currentUser] name];
    
    [self.statusTextView becomeFirstResponder];
}

- (void)onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onDoneButton {
    NSLog(@"onDoneButton");
    
//    if (self.in_reply_to_status_id.length > 0) {
//        NSLog(@"Reply Starting");
//        [[TwitterClient instance] replyToTweetId:self.in_reply_to_status_id withStatus:self.statusTextView.text success:^(AFHTTPRequestOperation *operation, id response) {
//            NSLog(@"Reply Success!");
//            [self dismissViewControllerAnimated:YES completion:nil];
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Reply Error! Error: %@", error);
//        }];
//    }
//    else {
        NSLog(@"Updating Status");
    
        [[TwitterClient instance] updateStatus:self.statusTextView.text success:^(AFHTTPRequestOperation *operation, id response) {
//           NSString *testString = @"Well keep testing till you get it right";
//          [[TwitterClient instance] updateStatus:testString success:^(AFHTTPRequestOperation *operation, id response) {
  
            NSLog(@"Status Updated. Now everyone knows about your cats");
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Twitter hates this update so much it's blocking your post: %@", error);
        }];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
