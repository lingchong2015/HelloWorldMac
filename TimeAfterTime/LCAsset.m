//
//  LCAsset.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/13.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCAsset.h"

@implementation LCAsset

- (NSString*)description {
    return [NSString stringWithFormat:@"<%@: $%u>", self.label, self.resaleValue];
}

- (void)dealloc {
    NSLog(@"deallocation %@", self);
}

@end
