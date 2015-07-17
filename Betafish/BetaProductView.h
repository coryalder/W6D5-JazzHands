//
//  BetaProductView.h
//  Betafish
//
//  Created by Cory Alder on 2015-07-13.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BetaProductView : UIView

@property (nonatomic, weak) IBOutlet UIImageView *appImageView;

@property (nonatomic, weak) IBOutlet UILabel *appNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *devNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;


+(BetaProductView *)betaView;

@end
