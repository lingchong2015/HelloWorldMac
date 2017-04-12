//
//  BNRPerson.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BNRPerson : NSObject { // 实例变量要声明在花括号内。
    // BNRPerson类拥有两个实例变量，按照惯例，实例变量的名字是以“_”开头的。
    float _heightInMeters;
    float _weightInKilos;
}

// BNRPerson拥有可以读取并设置实例变量的方法。
-(float)heightInMeters;
-(void)setHeightInMeters:(float)h;
-(float)weightInKilos;
-(void)setWeightInMeters:(float)w;
// BNRPerson拥有计算BMI的方法。
-(float)bodyMassIndex;

@end
