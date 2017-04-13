//
//  LCEmployee.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCEmployee.h"

@implementation LCEmployee

/*
 * LCEmployee的成员方法。
 */
- (double)yearsOfEmployment{
    if (self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval interval = [now timeIntervalSinceDate:self.hireDate];
        return interval / 31557600;
    } else {
        return 0;
    }
}

/*
 * 覆盖父类的方法。
 */
- (float)bodyMassIndex {
    return [super bodyMassIndex] * 0.9;
}

/*
 * 覆盖NSObject基类的方法。
 */
- (NSString*)description {
    return [NSString stringWithFormat:@"<Employee %u>", self.employeeID];
}

@end
