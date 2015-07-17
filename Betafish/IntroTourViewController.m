//
//  IntroTourViewController.m
//  Betafish
//
//  Created by Cory Alder on 2015-07-16.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "IntroTourViewController.h"

@interface IntroTourViewController ()

@property (nonatomic, strong) UILabel *pageOneLabel;
@property (nonatomic, strong) UILabel *pageTwoLabel;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation IntroTourViewController

- (instancetype)init
{
    if ((self = [super init])) {
        self.numberOfPages = 4;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentView.backgroundColor = [UIColor orangeColor];
    
    [self setupViews];
    [self setupAnimations];
}


-(void)setupViews {
    
    self.pageOneLabel = [[UILabel alloc] init];
    self.pageOneLabel.text = @"Swipe Left\nto dismiss";
    self.pageOneLabel.numberOfLines = 2;
    self.pageOneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.pageOneLabel];
    
    
    self.pageTwoLabel = [[UILabel alloc] init];
    self.pageTwoLabel.text = @"Swipe Right\nto favourite";
    self.pageTwoLabel.numberOfLines = 2;
    self.pageTwoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.pageTwoLabel];
}

-(void)setupAnimations {
    // keep one view on page 0 and 1
    // keep the other on page 1 only
    
    // constrain them both in the center y
    
    // animate some scaling between pages
    
    // animate one view's Y constraint constant.
    
}

@end
