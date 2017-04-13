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
    NSMutableArray *_assets;
}

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSArray *assets;//存取的数组都是不可变的。

- (double)yearsOfEmployment;
- (void)addAssets:(LCAsset *)asset;
- (unsigned int)valueOfAssets;

@end
