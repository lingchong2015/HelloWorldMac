//
//  LCEmployee.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCEmployee.h"

@implementation LCEmployee

- (double)yearsOfEmployment{
    if (self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval interval = [now timeIntervalSinceDate:self.hireDate];
        return interval / 31557600;
    } else {
        return 0;
    }
}

@end
