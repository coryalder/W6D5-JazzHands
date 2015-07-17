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
        self.numberOfPages = 5;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self setupViews];
    [self setupAnimations];
    
    //[self animateCurrentFrame];
    self.scrollView.delegate = self;
}


-(void)setupViews {
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.backgroundImageView];
//    self.backgroundImageView.hidden = true;
    
    self.pageOneLabel = [[UILabel alloc] init];
    self.pageOneLabel.text = @"Page 1 % 2";
    self.pageOneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.pageOneLabel];
    
    
    self.pageTwoLabel = [[UILabel alloc] init];
    self.pageTwoLabel.text = @"Page 2";
    self.pageTwoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.pageTwoLabel];
}

-(void)setupAnimations {
    [self keepView:self.pageOneLabel onPages:@[@(0), @(1)]];
    [self keepView:self.pageTwoLabel onPage:1];
    
    NSLayoutConstraint *p1LabelY = [NSLayoutConstraint constraintWithItem:self.pageOneLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f];
    
    NSLayoutConstraint *p2LabelY = [NSLayoutConstraint constraintWithItem:self.pageTwoLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.15f constant:0.f];
    
    [self.contentView addConstraints:@[p1LabelY, p2LabelY]];
    
    
    
    NSArray *verticalBgConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[bg]-(0)-|" options:0 metrics:nil views:@{ @"bg" : self.backgroundImageView }];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:(NSLayoutAttributeLeft) relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:1];
    
    [self.contentView addConstraints:verticalBgConstraints];
    [self.contentView addConstraints:@[widthConstraint, leftConstraint]];
    
    
    IFTTTConstraintConstantAnimation *xPositionAnimation = [IFTTTConstraintConstantAnimation animationWithSuperview:self.contentView constraint:leftConstraint];

    for (int i = 0; i < 4; i++) {
        [xPositionAnimation addKeyframeForTime:i value:@(i*self.pageWidth*0.88)];
    }

    [self.animator addAnimation:xPositionAnimation];

    
    // color
    
    IFTTTColorAnimation *bgColorAnimation = [IFTTTColorAnimation animationWithView:self.view];
    
    [bgColorAnimation addKeyframeForTime:0 color:[UIColor darkGrayColor]];
    [bgColorAnimation addKeyframeForTime:1 color:[UIColor orangeColor]];
    [bgColorAnimation addKeyframeForTime:2 color:[UIColor magentaColor]];
    [bgColorAnimation addKeyframeForTime:3 color:[UIColor purpleColor]];
    [bgColorAnimation addKeyframeForTime:4 color:[UIColor clearColor]];
    
    [self.animator addAnimation:bgColorAnimation];
    
    
}


#pragma mark - IFTTT Delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (scrollView.contentOffset.x > self.pageWidth * (self.numberOfPages-1)) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
