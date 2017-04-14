//
//  LCStockHolding.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/12.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCStockHolding.h"

@implementation LCStockHolding

/*
- (float)purchaseSharePrice {
    return _purchaseSharePrice;
}

- (void)setPurchaseSharePrice:(float)price {
    _purchaseSharePrice = price;
}

- (float)currentSharePrice {
    return _currentSharePrice;
}

- (void)setCurrentSharePrice:(float)price {
    _currentSharePrice = price;
}

- (int)numberOfShare {
    return _numberOfShare;
}

- (void)setNumberOfShare:(int)number {
    _numberOfShare = number;
}
 */

/*
 * 在头文件中声明了：
 * @property (nonatomic, readonly) int serial;
 * 属性（这个serial是属性，下面的initWithSerial:方法中的参数serial是行参，这里的serial是指属性），serial属性是只读属性，
 * 即在任何地方使用[self/someinstance setSelf]方法是不行的，但可以在类的方法内部使用_serial（编译器为自动为serial属性添
 * 加一个_serial实例变量），另外需要说明的是，实例变量默认为protected访问权限。
 */
- (instancetype)initWithSerial:(int)serial {
    self = [super init];
    _serial = serial;
    return self;
}

- (float)costInDollars {
    return [self purchaseSharePrice] * [self numberOfShare];
}

- (float)valueInDollars {
    return [self currentSharePrice] * [self numberOfShare];
}

- (NSString*)description {
    return [NSString stringWithFormat:@"<LCStockHolding - %d - %@>", _serial, _symbol];
}

- (void)dealloc {
    NSLog(@"dealloc: %@", self);
}

@end





























