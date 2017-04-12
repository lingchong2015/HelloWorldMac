//
//  BNRPerson.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

- (float)heightInMeters {
    return _heightInMeters;
}

- (void)setHeightInMeters:(float)h {
    _heightInMeters = h;
}

- (float)weightInKilos {
    return _weightInKilos;
}

- (void)setWeightInMeters:(float)w {
    _weightInKilos = w;
}

- (float)bodyMassIndex {
    return _weightInKilos / (_heightInMeters * _heightInMeters);
}

@end
