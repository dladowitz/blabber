//
//  ProfileViewController.h
//  blabber
//
//  Created by David Ladowitz on 4/3/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) User *user;

@end
