//
//  LCEmployee.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "BNRPerson.h"

@interface LCEmployee : BNRPerson

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

- (double)yearsOfEmployment;

@end
