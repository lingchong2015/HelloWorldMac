//
//  LCEmployee.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCEmployee.h"
#import "LCAsset.h"

@implementation LCEmployee

- (NSArray *)assets {
    return [_assets copy];// 返回_asset实例变量的不可变数组新实例。
}

- (void)setAssets:(NSArray *)assets {
    _assets = [assets mutableCopy];// 将一个可变数组新实例赋值给_assets实例变量。
}

- (void)addAssets:(LCAsset *)asset {
    if (_assets == nil) {
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:asset];
}

- (unsigned int)valueOfAssets {
    unsigned int sum = 0;
    for (LCAsset *item in _assets) {
        sum += item.resaleValue;
    }
    return sum;
}

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
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}

@end
