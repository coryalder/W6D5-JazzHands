//
//  ViewController.m
//  Betafish
//
//  Created by Cory Alder on 2015-07-13.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "ViewController.h"
#import "ZLSwipeableView.h"
#import "BetaProductView.h"

#import "Presentation-Swift.h"

#import "NSArray+RandomPicks.h"

#import "IntroTourViewController.h"

@interface ViewController () <ZLSwipeableViewDataSource, ZLSwipeableViewDelegate>

@property (nonatomic, strong) IBOutlet ZLSwipeableView *swipeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    IntroTourViewController *introController = [[IntroTourViewController alloc] init];
    
    [self presentViewController:introController animated:YES completion:nil];

}



-(void)presentationSetup {
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRect){0,0,120,60}];
    label.text = @"labeltext";
    label.backgroundColor = [UIColor purpleColor];
    
    Position *position = [[Position alloc] initWithLeft:0.2 top:0.5];
    
    Content *slideContent = [[Content alloc]initWithView:label position:position centered:YES];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:(CGRect){0,0,120,60}];
    label2.text = @"second label";
    label2.backgroundColor = [UIColor purpleColor];
    
    Position *position2 = [[Position alloc] initWithLeft:0.2 top:0.5];
    
    Content *slideContent2 = [[Content alloc]initWithView:label2 position:position2 centered:YES];
    
    SlideController *slideController = [[SlideController alloc] initWithContents:@[slideContent]];
    slideController.view.backgroundColor = [UIColor redColor];
    
    SlideController *slideController2 = [[SlideController alloc] initWithContents:@[slideContent2]];
    
    PresentationController *presentation = [[PresentationController alloc] initWithPages:@[slideController, slideController2]];
    
    [self presentViewController:presentation animated:YES completion:nil];
    
    
}

#pragma mark - ZLSwipeableViewDataSource

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    
    BetaProductView *view = [BetaProductView betaView];
    
    view.devNameLabel.text = [self randomDevName];
    view.appNameLabel.text = [self randomAppName];
    view.descriptionLabel.text = [self randomDescription];
    view.appImageView.image = [UIImage imageNamed:@"icon"];
    
    return view;
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    NSLog(@"Swiped!");
}


-(NSString *)randomDevName {
    NSArray *dev_fn = @[@"Sarah", @"Jim", @"Carly", @"Alex", @"Dev", @"Tal", @"Muhammad", @"Fatima"];
    NSArray *dev_ln = @[@"Clark", @"Woo", @"Lee", @"Smith", @"Alexander", @"Ali"];
    
    return [NSString stringWithFormat:@"By %@ %@", [dev_fn randomObject], [dev_ln randomObject]];
}

-(NSString *)randomAppName {
    NSArray *app_start = @[@"Pl", @"Ur", @"Ny", @"Trip", @"Dat", @"Travel", @"Ride", @"Tr", @"St", @"Fl", @"Cr", @"Sl", @"Ticket", @"Laser", @"Mob", @"Shar", @"Sh", @"Fr", @"Global", @"Wond",@"Star", @"Fav"];
    NSArray *app_middle = @[@"oo", @"y", @"ii", @"s", @"ee", @"aa", @"a", @"i", @"uu", @"u",@"",@""];
    NSArray *app_end = @[@"yr", @"st", @"ft", @"r", @"Hub", @"ck", @"yp", @"er", @"box", @"fy", @"rts", @"lts", @"rt", @"Wire", @"Line", @"Site", @"gle", @"le", @"dle" @"", @"",@""];
    
    NSString *start = [app_start randomObject];
    NSString *middle = [app_middle randomObject];
    NSString *end = [app_end randomObject];
    
    return [NSString stringWithFormat:@"%@%@%@", start, middle, end];
}

-(NSString *)randomDescription {
    NSArray *dev_ft = @[@"Tinder", @"Uber", @"Pinterest", @"Instagram", @"Twitter", @"Stubhub", @"Afterlight", @"Google", @"eBay", @"iPad", @"Rideshare", @"Fedex", @"Lyft", @"Email",@"LinkedIn", @"Facebook", @"Tumblr", @"Farmville", @"Flappy Bird", @"Yelp", @"Glitterbombs", @"Pocket Protectors", @"Sina Weibo", @"Craigslist", @"Alibaba.com"];
    
    NSArray *dev_lt = @[@"students", @"teachers", @"janitors", @"ghosts", @"chefs", @"dog walkers", @"ninjas", @"octagenarians", @"goats", @"goat herders", @"goat walkers", @"pipefitters", @"millwrights", @"minecrafters", @"patricians", @"plebs", @"moonwalkers", @"unicorns", @"plumbers", @"personal trainers", @"rope charmers", @"street performers", @"blockheads", @"circus geeks", @"leather tanners", @"legal clerks", @"pediatricians", @"puppetmakers", @"toddlers", @"deerhunters", @"Steven Segal", @"iOS developers", @"polecats"];
    
    return [NSString stringWithFormat:@"%@ for %@", [dev_ft randomObject], [dev_lt randomObject]];
}

@end
