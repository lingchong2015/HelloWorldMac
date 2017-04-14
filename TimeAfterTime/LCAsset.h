//
//  LCAsset.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/13.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCEmployee;

@interface LCAsset : NSObject

@property (nonatomic, copy) NSString *label;

@property (nonatomic) unsigned int resaleValue;

/*
 * 如果holder指向的对象LCEployee实例被释放（如设置为nil），那么holder也会被设置为nil，弱引用所指向的实例变量或属性可能会消失。
 */
@property (nonatomic, weak) LCEmployee *holder;

@end
