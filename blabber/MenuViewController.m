//
//  MenuViewController.m
//  blabber
//
//  Created by David Ladowitz on 4/4/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "MenuViewController.h"
#import "ProfileViewController.h"
#import "TimelineViewController.h"
#import "ComposeViewController.h"
#import "User.h"


@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) NSArray *viewControllers;
- (IBAction)onProfileButton:(id)sender;
- (IBAction)onTimelineButton:(id)sender;
- (IBAction)onMentionsButton:(id)sender;



@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.viewControllers = @[[[ProfileViewController alloc] init], [[TimelineViewController alloc] init], [[TimelineViewController alloc] init]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Setting navigation buttons
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStyleDone target:self action:@selector(onSignOutButton)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(onComposeButton)];
    
    // Setting toolbar items on bottom
    UIBarButtonItem *signOutButton = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Sign Out"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(onSignOutButton)];
    
    UIBarButtonItem *composeButton = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Compose"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(onComposeButton)];

    
    NSArray *toolbarButtons = @[signOutButton, composeButton];
    [self setToolbarItems:toolbarButtons];
   
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [self.containerView addGestureRecognizer:panGestureRecognizer];
    
    UIView *profileView = ((UIViewController *)self.viewControllers[0]).view;
    profileView.frame = self.containerView.frame;
    
    UIView *timelineView = ((UIViewController *)self.viewControllers[1]).view;
    timelineView.frame = self.containerView.frame;
    
    
    [self.containerView addSubview:profileView];
    [self.containerView addSubview:timelineView];
}

- (void)onPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    
    // Gets distance moved x,y
    CGPoint translation = [panGestureRecognizer translationInView:self.view.superview];
    
    // sets the center as old center plus amount moved in each direction
    panGestureRecognizer.view.center = CGPointMake(panGestureRecognizer.view.center.x + translation.x, 284);
    
    // Prevents view from moving offscreen to the left
    if (panGestureRecognizer.view.center.x < 160) {
        panGestureRecognizer.view.center = CGPointMake(160, 284);
        
        // Prevents view from moving too far to the right
    } else if (panGestureRecognizer.view.center.x > 450) {
        panGestureRecognizer.view.center = CGPointMake(450, 284);
    }
    
    // Resets the translation property for next use
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    
    //    NSLog(@"%@", translation);
    //    CGPoint touchPoint = [panGestureRecognizer locationInView:self.view.superview];
    //    CGPoint velocity = [panGestureRecognizer velocityInView:self.view.superview];
    //    NSLog(@"Gesture: %@", NSStringFromCGPoint(touchPoint));
    //    NSLog(@"Velocity: %@", NSStringFromCGPoint(velocity));
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onProfileButton:(id)sender {
    NSLog(@"profile button");
    UIView *profileView = ((UIViewController *)self.viewControllers[0]).view;
    [self.containerView bringSubviewToFront:profileView];
}

- (IBAction)onTimelineButton:(id)sender {
    NSLog(@"timeline button");
    UIView *timelineView = ((UIViewController *)self.viewControllers[1]).view;
    [self.containerView bringSubviewToFront:timelineView];
}

- (IBAction)onMentionsButton:(id)sender {
    NSLog(@"mention button");
    UIView *timelineView = ((UIViewController *)self.viewControllers[1]).view;
    [self.containerView bringSubviewToFront:timelineView];
}

// Logs user out by setting currentUser to nil
- (void)onSignOutButton
{
    [User setCurrentUser:nil];
}


- (void)onComposeButton
{
    NSLog(@"Compose Button Clicked");
    ComposeViewController *composeVC = [[ComposeViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController: composeVC];
    [self presentViewController:nvc animated:YES completion:nil];
}
@end
