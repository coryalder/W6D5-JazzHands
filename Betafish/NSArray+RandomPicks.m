//
//  NSArray+RandomPicks.m
//  Betafish
//
//  Created by Cory Alder on 2015-07-16.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

#import "NSArray+RandomPicks.h"

@implementation NSArray (RandomPicks)

-(id)randomObject {
    if (self.count < 1) return nil;
    return [self objectAtIndex:arc4random_uniform(self.count)];
}

@end
