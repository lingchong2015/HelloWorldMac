//
//  LCForeignStockHolding.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/13.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCForeignStockHolding.h"

@implementation LCForeignStockHolding

- (float)costInDollars{
    return [super costInDollars] * self.conversionRate;
}

- (float)valueInDollars{
    return [super valueInDollars] * self.conversionRate;
}

@end
