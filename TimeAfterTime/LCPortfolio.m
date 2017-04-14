//
//  LCPortfolio.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/14.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCPortfolio.h"
#include "LCStockHolding.h"

@interface LCPortfolio() {
    NSMutableArray *_holdings;//
}

@end

@implementation LCPortfolio

- (NSArray*)holdings {
    return [_holdings copy];
}

- (void)setHoldings:(NSArray *)holdings {
    _holdings = [holdings mutableCopy];
}

- (void)addHolding:(LCStockHolding *)holding {
    if (!_holdings) {
        _holdings = [[NSMutableArray alloc] init];
    }
    [_holdings addObject:holding];
}

- (void)removeHoldings:(int)index {
    if (!_holdings) {
        return;
    }
    [_holdings removeObjectAtIndex:index];
}

- (float)totalValue {
    int value = 0;
    for (LCStockHolding *item in _holdings) {
        value += item.currentSharePrice * item.numberOfShare;
    }
    return value;
}

@end
