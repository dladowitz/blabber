//
//  LoginViewController.m
//  blabber
//
//  Created by David Ladowitz on 3/28/14.
//  Copyright (c) 2014 Little Cat Labs. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *backgroundImageView;
@property (weak, nonatomic) NSArray *animationArray;
- (IBAction)onLogin:(id)sender;

@end

@implementation LoginViewController

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
    // Do any additional setup after loading the view from its nib.
    
    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 500, 225)];

    [self createAnimationArray];
    
    animatedImageView.animationImages = self.animationArray;
    animatedImageView.animationDuration = 25.0f;
    animatedImageView.animationRepeatCount = 0;
    [animatedImageView startAnimating];
    [self.backgroundImageView addSubview: animatedImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogin:(id)sender {
    NSLog(@"Pressed the Login Button");
    [[TwitterClient instance] login];
}

- (void)createAnimationArray {
    self.animationArray = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"bg1.png"],
                           [UIImage imageNamed:@"bg2.png"],
                           [UIImage imageNamed:@"bg3.png"],
                           [UIImage imageNamed:@"bg4.png"],
                           [UIImage imageNamed:@"bg5.png"],
                           [UIImage imageNamed:@"bg6.png"],
                           [UIImage imageNamed:@"bg7.png"],
                           [UIImage imageNamed:@"bg8.png"],
                           [UIImage imageNamed:@"bg9.png"],
                           [UIImage imageNamed:@"bg10.png"],
                           [UIImage imageNamed:@"bg11.png"],
                           [UIImage imageNamed:@"bg12.png"],
                           [UIImage imageNamed:@"bg13.png"],
                           [UIImage imageNamed:@"bg14.png"],
                           [UIImage imageNamed:@"bg15.png"],
                           [UIImage imageNamed:@"bg16.png"],
                           [UIImage imageNamed:@"bg17.png"],
                           [UIImage imageNamed:@"bg18.png"],
                           [UIImage imageNamed:@"bg19.png"],
                           [UIImage imageNamed:@"bg20.png"],
                           [UIImage imageNamed:@"bg21.png"],
                           [UIImage imageNamed:@"bg22.png"],
                           [UIImage imageNamed:@"bg23.png"],
                           [UIImage imageNamed:@"bg24.png"],
                           [UIImage imageNamed:@"bg25.png"],
                           [UIImage imageNamed:@"bg26.png"],
                           [UIImage imageNamed:@"bg27.png"],
                           [UIImage imageNamed:@"bg28.png"],
                           [UIImage imageNamed:@"bg29.png"],
                           [UIImage imageNamed:@"bg30.png"],
                           [UIImage imageNamed:@"bg31.png"],
                           [UIImage imageNamed:@"bg32.png"],
                           [UIImage imageNamed:@"bg33.png"],
                           [UIImage imageNamed:@"bg34.png"],
                           [UIImage imageNamed:@"bg35.png"],
                           [UIImage imageNamed:@"bg36.png"],
                           [UIImage imageNamed:@"bg37.png"],
                           [UIImage imageNamed:@"bg38.png"],
                           [UIImage imageNamed:@"bg39.png"],
                           [UIImage imageNamed:@"bg40.png"],
                           [UIImage imageNamed:@"bg41.png"],
                           [UIImage imageNamed:@"bg42.png"],
                           [UIImage imageNamed:@"bg43.png"],
                           [UIImage imageNamed:@"bg44.png"],
                           [UIImage imageNamed:@"bg45.png"],
                           [UIImage imageNamed:@"bg46.png"],
                           [UIImage imageNamed:@"bg47.png"],
                           [UIImage imageNamed:@"bg48.png"],
                           [UIImage imageNamed:@"bg49.png"],
                           [UIImage imageNamed:@"bg50.png"],
                           [UIImage imageNamed:@"bg51.png"],
                           [UIImage imageNamed:@"bg52.png"],
                           [UIImage imageNamed:@"bg53.png"],
                           [UIImage imageNamed:@"bg54.png"],
                           [UIImage imageNamed:@"bg55.png"],
                           [UIImage imageNamed:@"bg56.png"],
                           [UIImage imageNamed:@"bg57.png"],
                           [UIImage imageNamed:@"bg58.png"],
                           [UIImage imageNamed:@"bg59.png"],
                           [UIImage imageNamed:@"bg60.png"],
                           [UIImage imageNamed:@"bg61.png"],
                           [UIImage imageNamed:@"bg62.png"],
                           [UIImage imageNamed:@"bg63.png"],
                           [UIImage imageNamed:@"bg64.png"],
                           [UIImage imageNamed:@"bg65.png"],
                           [UIImage imageNamed:@"bg66.png"],
                           [UIImage imageNamed:@"bg67.png"],
                           [UIImage imageNamed:@"bg68.png"],
                           [UIImage imageNamed:@"bg69.png"],
                           [UIImage imageNamed:@"bg70.png"],
                           [UIImage imageNamed:@"bg71.png"],
                           [UIImage imageNamed:@"bg72.png"],
                           [UIImage imageNamed:@"bg73.png"],
                           [UIImage imageNamed:@"bg74.png"],
                           [UIImage imageNamed:@"bg75.png"],
                           [UIImage imageNamed:@"bg76.png"],
                           [UIImage imageNamed:@"bg77.png"],
                           [UIImage imageNamed:@"bg78.png"],
                           [UIImage imageNamed:@"bg79.png"],
                           [UIImage imageNamed:@"bg80.png"],
                           [UIImage imageNamed:@"bg81.png"],
                           [UIImage imageNamed:@"bg82.png"],
                           [UIImage imageNamed:@"bg83.png"],
                           [UIImage imageNamed:@"bg84.png"],
                           [UIImage imageNamed:@"bg85.png"],
                           [UIImage imageNamed:@"bg86.png"],
                           [UIImage imageNamed:@"bg87.png"],
                           [UIImage imageNamed:@"bg88.png"],
                           [UIImage imageNamed:@"bg89.png"],
                           [UIImage imageNamed:@"bg90.png"],
                           [UIImage imageNamed:@"bg91.png"],
                           [UIImage imageNamed:@"bg92.png"],
                           [UIImage imageNamed:@"bg93.png"],
                           [UIImage imageNamed:@"bg94.png"],
                           [UIImage imageNamed:@"bg95.png"],
                           [UIImage imageNamed:@"bg96.png"],
                           [UIImage imageNamed:@"bg97.png"],
                           [UIImage imageNamed:@"bg98.png"],
                           [UIImage imageNamed:@"bg99.png"],
                           [UIImage imageNamed:@"bg100.png"],
                           [UIImage imageNamed:@"bg101.png"],
                           [UIImage imageNamed:@"bg102.png"],
                           [UIImage imageNamed:@"bg103.png"],
                           [UIImage imageNamed:@"bg104.png"],
                           [UIImage imageNamed:@"bg105.png"],
                           [UIImage imageNamed:@"bg106.png"],
                           [UIImage imageNamed:@"bg107.png"],
                           [UIImage imageNamed:@"bg108.png"],
                           [UIImage imageNamed:@"bg109.png"],
                           [UIImage imageNamed:@"bg110.png"],
                           [UIImage imageNamed:@"bg111.png"],
                           [UIImage imageNamed:@"bg112.png"],
                           [UIImage imageNamed:@"bg113.png"],
                           [UIImage imageNamed:@"bg114.png"],
                           [UIImage imageNamed:@"bg115.png"],
                           [UIImage imageNamed:@"bg116.png"],
                           [UIImage imageNamed:@"bg117.png"],
                           [UIImage imageNamed:@"bg118.png"],
                           [UIImage imageNamed:@"bg119.png"],
                           [UIImage imageNamed:@"bg120.png"],
                           [UIImage imageNamed:@"bg121.png"],
                           [UIImage imageNamed:@"bg122.png"],
                           [UIImage imageNamed:@"bg123.png"],
                           [UIImage imageNamed:@"bg124.png"],
                           [UIImage imageNamed:@"bg125.png"],
                           [UIImage imageNamed:@"bg126.png"],
                           [UIImage imageNamed:@"bg127.png"],
                           [UIImage imageNamed:@"bg128.png"],
                           [UIImage imageNamed:@"bg129.png"],
                           [UIImage imageNamed:@"bg130.png"],
                           [UIImage imageNamed:@"bg131.png"],
                           [UIImage imageNamed:@"bg132.png"],
                           [UIImage imageNamed:@"bg133.png"],
                           [UIImage imageNamed:@"bg134.png"],
                           [UIImage imageNamed:@"bg135.png"],
                           [UIImage imageNamed:@"bg136.png"],
                           [UIImage imageNamed:@"bg137.png"],
                           [UIImage imageNamed:@"bg138.png"],
                           [UIImage imageNamed:@"bg139.png"],
                           [UIImage imageNamed:@"bg140.png"],
                           [UIImage imageNamed:@"bg141.png"],
                           [UIImage imageNamed:@"bg142.png"],
                           [UIImage imageNamed:@"bg143.png"],
                           [UIImage imageNamed:@"bg144.png"],
                           [UIImage imageNamed:@"bg145.png"],
                           [UIImage imageNamed:@"bg146.png"],
                           [UIImage imageNamed:@"bg147.png"],
                           [UIImage imageNamed:@"bg148.png"],
                           [UIImage imageNamed:@"bg149.png"],
                           [UIImage imageNamed:@"bg150.png"],
                           [UIImage imageNamed:@"bg151.png"],
                           [UIImage imageNamed:@"bg152.png"],
                           [UIImage imageNamed:@"bg153.png"],
                           [UIImage imageNamed:@"bg154.png"],
                           [UIImage imageNamed:@"bg155.png"],
                           [UIImage imageNamed:@"bg156.png"],
                           [UIImage imageNamed:@"bg157.png"],
                           [UIImage imageNamed:@"bg158.png"],
                           [UIImage imageNamed:@"bg159.png"],
                           [UIImage imageNamed:@"bg160.png"],
                           [UIImage imageNamed:@"bg161.png"],
                           [UIImage imageNamed:@"bg162.png"],
                           [UIImage imageNamed:@"bg163.png"],
                           [UIImage imageNamed:@"bg164.png"],
                           [UIImage imageNamed:@"bg165.png"],
                           [UIImage imageNamed:@"bg166.png"],
                           [UIImage imageNamed:@"bg167.png"],
                           [UIImage imageNamed:@"bg168.png"],
                           [UIImage imageNamed:@"bg169.png"],
                           [UIImage imageNamed:@"bg170.png"],
                           [UIImage imageNamed:@"bg171.png"],
                           [UIImage imageNamed:@"bg172.png"],
                           [UIImage imageNamed:@"bg173.png"],
                           [UIImage imageNamed:@"bg174.png"],
                           [UIImage imageNamed:@"bg175.png"],
                           [UIImage imageNamed:@"bg176.png"],
                           [UIImage imageNamed:@"bg177.png"],
                           [UIImage imageNamed:@"bg178.png"],
                           [UIImage imageNamed:@"bg179.png"],
                           [UIImage imageNamed:@"bg180.png"],
                           [UIImage imageNamed:@"bg181.png"],
                           [UIImage imageNamed:@"bg182.png"],
                           [UIImage imageNamed:@"bg183.png"],
                           [UIImage imageNamed:@"bg184.png"],
                           [UIImage imageNamed:@"bg185.png"],
                           [UIImage imageNamed:@"bg186.png"],
                           [UIImage imageNamed:@"bg187.png"],
                           [UIImage imageNamed:@"bg188.png"],
                           [UIImage imageNamed:@"bg189.png"],
                           [UIImage imageNamed:@"bg190.png"],
                           [UIImage imageNamed:@"bg191.png"],
                           [UIImage imageNamed:@"bg192.png"],
                           [UIImage imageNamed:@"bg193.png"],
                           [UIImage imageNamed:@"bg194.png"],
                           [UIImage imageNamed:@"bg195.png"],
                           [UIImage imageNamed:@"bg196.png"],
                           [UIImage imageNamed:@"bg197.png"],
                           [UIImage imageNamed:@"bg198.png"],
                           [UIImage imageNamed:@"bg199.png"],
                           [UIImage imageNamed:@"bg200.png"],
                           [UIImage imageNamed:@"bg201.png"],
                           [UIImage imageNamed:@"bg202.png"],
                           [UIImage imageNamed:@"bg203.png"],
                           [UIImage imageNamed:@"bg204.png"],
                           [UIImage imageNamed:@"bg205.png"],
                           [UIImage imageNamed:@"bg206.png"],
                           [UIImage imageNamed:@"bg207.png"],
                           [UIImage imageNamed:@"bg208.png"],
                           [UIImage imageNamed:@"bg209.png"],
                           [UIImage imageNamed:@"bg210.png"],
                           [UIImage imageNamed:@"bg211.png"],
                           [UIImage imageNamed:@"bg212.png"],
                           [UIImage imageNamed:@"bg213.png"],
                           [UIImage imageNamed:@"bg214.png"],
                           [UIImage imageNamed:@"bg215.png"],
                           [UIImage imageNamed:@"bg216.png"],
                           [UIImage imageNamed:@"bg217.png"],
                           [UIImage imageNamed:@"bg218.png"],
                           [UIImage imageNamed:@"bg219.png"],
                           [UIImage imageNamed:@"bg220.png"],
                           [UIImage imageNamed:@"bg221.png"],
                           [UIImage imageNamed:@"bg222.png"],
                           [UIImage imageNamed:@"bg223.png"],
                           [UIImage imageNamed:@"bg224.png"],
                           [UIImage imageNamed:@"bg225.png"],
                           [UIImage imageNamed:@"bg226.png"],
                           [UIImage imageNamed:@"bg227.png"],
                           [UIImage imageNamed:@"bg228.png"],
                           [UIImage imageNamed:@"bg229.png"],
                           [UIImage imageNamed:@"bg230.png"],
                           [UIImage imageNamed:@"bg231.png"],
                           [UIImage imageNamed:@"bg232.png"],
                           [UIImage imageNamed:@"bg233.png"],
                           [UIImage imageNamed:@"bg234.png"],
                           [UIImage imageNamed:@"bg235.png"],
                           [UIImage imageNamed:@"bg236.png"],
                           [UIImage imageNamed:@"bg237.png"],
                           [UIImage imageNamed:@"bg238.png"],
                           [UIImage imageNamed:@"bg239.png"],
                           [UIImage imageNamed:@"bg240.png"],
                           [UIImage imageNamed:@"bg241.png"],
                           [UIImage imageNamed:@"bg242.png"],
                           [UIImage imageNamed:@"bg243.png"],
                           [UIImage imageNamed:@"bg244.png"],
                           [UIImage imageNamed:@"bg245.png"],
                           [UIImage imageNamed:@"bg246.png"],
                           [UIImage imageNamed:@"bg247.png"],
                           [UIImage imageNamed:@"bg248.png"],
                           [UIImage imageNamed:@"bg249.png"],
                           [UIImage imageNamed:@"bg250.png"],
                           nil];
}
@end
