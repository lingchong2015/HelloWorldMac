//
//  LCChapter25.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/17.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * #define定义的宏可以在不引用头文件的情况下（如不引用LCChapter25.h）在其它代码中调用，但是会提示类似“不符合C99标准”的警告，这一点
 * 与常量不一样，使用常量必须声明头文件，但两者（宏与全局变量）的相同点在于都不需要引用时类名。
 */
#define ISMAX(a, b) a > b ? 1 : 0

typedef NS_ENUM(char, BlenderSpeed) {
    BlenderSpeedStir,// 搅动。
    BlenderSpeedChop,// 剁碎。
    BlenderSpeedLiquefy,// 溶解。
    BlenderSpeedPulse,// 震动。
    BlenderSpeedIceCrush//碎冰。
};

/*
 * 全局变量在引用的时候不需要类名，如引用MyName需要先声明LCChapter25.h，然后直接使用MyName即可。
 */
extern NSString const *MyName;

@interface LCChapter25 : NSObject

@property (nonatomic) BlenderSpeed blenderSpeed;

@end
