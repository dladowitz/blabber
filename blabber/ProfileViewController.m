//
//  ProfileViewController.m
//  blabber
//
//  Created by David Ladowitz on 4/3/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "ProfileViewController.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterHandleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *tweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;



@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Profile";
    [self setupUser];
}

- (void)setUser:(User *)user
{
    NSLog(@"ProfileViewController:setUser %@",user.name);
    _user = user;
    [self setupUser];
}

- (void)setupUser
{
    if (!self.user) {
        self.user = [User currentUser];
    }
    
    self.usernameLabel.text = self.user.name;
    self.twitterHandleLabel.text = self.user.screen_name;
    [self.userProfileImage setImageWithURL:[NSURL URLWithString:self.user.profile_image_url]];
    self.tweetCountLabel.text = [NSString stringWithFormat:@"%@",self.user.statusCount];
    self.followersCountLabel.text = [NSString stringWithFormat:@"%@",self.user.followerCount];
    self.followingCountLabel.text = [NSString stringWithFormat:@"%@",self.user.friendCount];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
