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
    
    [self keepView:self.pageOneLabel onPages:@[@(0), @(1)]];
    [self keepView:self.pageTwoLabel onPage:1];
    
    // keep one view on page 0 and 1
    // keep the other on page 1 only
    
    NSLayoutConstraint *l1Y = [NSLayoutConstraint constraintWithItem:self.pageOneLabel attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeCenterY) multiplier:1.0 constant:0];
    
    [self.contentView addConstraint:l1Y];
    
    NSLayoutConstraint *l2Y = [NSLayoutConstraint constraintWithItem:self.pageTwoLabel attribute:(NSLayoutAttributeCenterY) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeCenterY) multiplier:0.8 constant:0];
    
    [self.contentView addConstraint:l2Y];
    
    
    IFTTTScaleAnimation *scaleAnimation = [IFTTTScaleAnimation animationWithView:self.pageOneLabel];
    
    [scaleAnimation addKeyframeForTime:0 scale:1.0];
    [scaleAnimation addKeyframeForTime:1 scale:1.50];
    [scaleAnimation addKeyframeForTime:2 scale:0.5];

    [self.animator addAnimation:scaleAnimation];
    
    // animate one view's Y constraint constant.
    
    IFTTTConstraintConstantAnimation *constraintAnimation = [IFTTTConstraintConstantAnimation animationWithSuperview:self.contentView constraint:l2Y];
    
    [constraintAnimation addKeyframeForTime:0 constant:-1000];
    [constraintAnimation addKeyframeForTime:1 constant:0];
    
    [self.animator addAnimation:constraintAnimation];
    
    
    
    
}

@end
