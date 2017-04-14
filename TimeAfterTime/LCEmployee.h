//
//  LCEmployee.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "BNRPerson.h"
@class LCAsset;

@interface LCEmployee : BNRPerson{
    // NSMutableArray *_assets;
}

/*
 * 子类不能获得父类属性中由编译器动态生成的实例变量，如属性employeeID的实例变量_employeeID。
 */
@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSArray *assets;//存取的数组都是不可变的。

- (double)yearsOfEmployment;
- (void)addAsset:(LCAsset *)asset;
- (void)removeAssets:(NSUInteger)index;
- (unsigned int)valueOfAssets;

@end
