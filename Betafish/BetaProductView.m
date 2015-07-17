//
//  BetaProductView.m
//  Betafish
//
//  Created by Cory Alder on 2015-07-13.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "BetaProductView.h"

@implementation BetaProductView

+(BetaProductView *)betaView {
    BetaProductView *firstView = [[[NSBundle mainBundle] loadNibNamed:@"BetaProductView" owner:self options:nil] firstObject];
    
    firstView.backgroundColor = [UIColor lightGrayColor];
    
    return firstView;
}

@end
