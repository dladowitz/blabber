//
//  TimelineViewController.m
//  blabber
//
//  Created by David Ladowitz on 3/29/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "TimelineViewController.h"
#import "TweetCell.h"
#import "ComposeViewController.h"
#import "TweetViewController.h"
#import <UIImageView+AFNetworking.h>
#import "User.h"
#import "TwitterClient.h"
#import "ProfileViewController.h"
#import "MenuViewController.h"

@interface TimelineViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tweets;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (assign, nonatomic) BOOL showMentions;

//- (void)onSignOutButton;
- (void)reload;

@end

@implementation TimelineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Twitter";
        self.showMentions = NO;
        [self reload];
    }
    return self;
}

- (id)initAndShowMentions:(BOOL)showMentions

{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Twitter";
        self.showMentions = showMentions;
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *customNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tableView registerNib:customNib forCellReuseIdentifier:@"TweetCell"];
    
    //Setting navigation buttons
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStyleDone target:self action:@selector(onSignOutButton)];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(onComposeButton)];
    
    //Refresh Control
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshView) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
}

#pragma mark - Table View Methods

// Setting number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}


// Creating cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TweetCell";
    TweetCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];

    cell.backgroundColor = [UIColor colorWithRed:(14/255.0) green:(172/255.0) blue:(255/255.0) alpha:1];
    
    // Setting cell data from Tweet object
    cell.statusLabel.text = tweet.tweet_text;
    cell.nameLabel.text = tweet.name;
    cell.twitterHandleLabel.text = tweet.twitter_handle;
    cell.timeStampLabel.text = tweet.relative_timestamp;

    // Tap on profile image to go to ProfileViewController
    UITapGestureRecognizer *tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(profileOnTap:)];
    
    cell.profileImageView.tag = indexPath.row;
    [cell.profileImageView setUserInteractionEnabled:YES];
    [tapgesture setDelegate:self];
    [cell.profileImageView addGestureRecognizer:tapgesture];
    
    [cell.profileImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:tweet.profile_image_url]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        cell.profileImageView.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    return cell;
}

// Getting dynamic height of cell based on 'status' label
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Tweet *tweet = self.tweets[indexPath.row];
    
    NSString *text = tweet.tweet_text;
    UIFont *fontText = [UIFont systemFontOfSize:15.0];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(225, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:fontText}
                                     context:nil];
    
    CGFloat heightOffset = 45;
    return rect.size.height + heightOffset;
}

#pragma mark - Table View delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected row %d", indexPath.row);
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    Tweet *tweet = self.tweets[indexPath.row];
    
    TweetViewController *tvc = [[TweetViewController alloc] initWithNibName:@"TweetViewController" andModel:tweet bundle:nil];

    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController: tvc];
    [self presentViewController:navigationVC animated:YES completion:nil];

}

#pragma mark - Private

// Moved to Menu View
// Logs user out by setting currentUser to nil
//- (void)onSignOutButton
//{
//    [User setCurrentUser:nil];
//}

- (void)reload
{
    if (self.showMentions) {
        // Getting mentions from API
        [[TwitterClient instance] mentionsWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"You've been mentioned by people: %@", response);
            
            // Initializing tweet model with array of json
            self.tweets = [Tweet tweetsWithArray:response];
            [self setTitle:@"Mentions"];
         
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"No one loves you enough to mention you!");
        }];
    } else {
        // Getting last 20 tweets from home timeline API
            [[TwitterClient instance] homeTimelineWithCount:20 sinceId:0 maxId:0 success:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"You've go the best json I've ever seen: %@", response);
            
            // Initializing tweet model with array of json
            self.tweets = [Tweet tweetsWithArray:response];
            [self setTitle:@"Home"];
                
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"You've been very bad. No tweets for you!");
        }];
    }

}

// Moved to Menu View
//- (void)onComposeButton
//{
//    NSLog(@"Compose Button Clicked");
//    ComposeViewController *composeVC = [[ComposeViewController alloc] init];
//    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController: composeVC];
//    [self presentViewController:nvc animated:YES completion:nil];
//}

- (void)refreshView
{   NSLog(@"Lets see some more tweets!");
    
    [[TwitterClient instance] homeTimelineWithCount:20 sinceId:0 maxId:0 success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.tweets = [Tweet tweetsWithArray:response];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"!");
    }];
    
    [self.refreshControl endRefreshing];
}
- (void)setTitle:(NSString *)title {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(title, @"");
    [label sizeToFit];
}


- (void)profileOnTap:(UIGestureRecognizer *)tap
{
    NSLog(@"Tapping that");
    Tweet *tweet = [self.tweets objectAtIndex:tap.view.tag];
    
    ProfileViewController *pvc = [[ProfileViewController alloc] init];
    pvc.user = tweet.user;

    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController: pvc];
    [self presentViewController:navigationVC animated:YES completion:nil];
//    [self.navigationController pushViewController:navigationVC animated:YES];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
