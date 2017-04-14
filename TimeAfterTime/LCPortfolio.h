//
//  LCPortfolio.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/14.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCStockHolding;

@interface LCPortfolio : NSObject {
    NSMutableArray *_holdings;
}

@property (atomic) NSArray *holdings;

- (void)addHolding:(LCStockHolding *)holding;

- (void)removeHoldings:(int)index;

- (float)totalValue;

@end
