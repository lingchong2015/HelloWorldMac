//
//  LCEmployee.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCEmployee.h"
#import "LCAsset.h"

/*
 * 声明类扩展，在类扩展中的实例变量、属性与方法只有类与类的实例能够访问，对于非LCEmployee接口/类（包括LCEmployee的子类）来说，唯一可见的
 * 是LCEmployee头文件中的属性与方法。
 */
@interface LCEmployee() {
    NSMutableArray *_assets;
}

@property (nonatomic) unsigned int officeAlarmCode;

@end

@implementation LCEmployee

- (NSArray *)assets {
    return [_assets copy];// 返回_asset实例变量的不可变数组新实例。
}

- (void)setAssets:(NSArray *)assets {
    _assets = [assets mutableCopy];// 将一个可变数组新实例赋值给_assets实例变量。
}

- (void)addAsset:(LCAsset *)asset {
    if (_assets == nil) {
        _assets = [[NSMutableArray alloc] init];
    }
    [_assets addObject:asset];
}

- (void)removeAssets:(NSUInteger)index {
    if (_assets == nil) {
        return;
    }
    [_assets removeObjectAtIndex:index];
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
