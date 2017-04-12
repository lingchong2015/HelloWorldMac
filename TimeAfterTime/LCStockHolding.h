//
//  LCStockHolding.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCStockHolding : NSObject {
    // float _purchaseSharePrice;
    // float _currentSharePrice;
    // int _numberOfShare;
}

@property (nonatomic) float purchaseSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) float numberOfShare;
@property (nonatomic, readonly) int serial;

/*
- (float)purchaseSharePrice;

- (void)setPurchaseSharePrice:(float)price;

- (float)currentSharePrice;

- (void)setCurrentSharePrice:(float)price;

- (int)numberOfShare;

- (void)setNumberOfShare:(int)number;
 */

- (instancetype)initWithSerial:(int)serial;

- (float)costInDollars;

- (float)valueInDollars;

@end
