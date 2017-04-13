//
//  main.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/10.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "chapter16.h"
#include "chapter17.h"
#include "BNRPerson.h"
#include "LCStockHolding.h"
#include "LCEmployee.h"
#include "LCForeignStockHolding.h"
#include "LCAsset.h"

/*
 * 我目前（2017年4月10日晚10点35分）对消息发送（message send）机制的理解：
 * 起初的理解是接收方（receiver）是类或对象，这一点应该没错，选择器（selector）是方法名，这是基于下面的方法理解的：
 * [NSHost currentHost];// 没有参数。
 * [components setYear:1983];// 一个参数。
 * 但是后来看到有多个参数的选择器，发现并非如此，选择器应该是具名形参的组合，不同的具名行参组合在一起确定一个方法，这是基于下面的方法理解的：
 * [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now];// 多个参数。
 */

void showHostName() {
    NSHost *host = [NSHost currentHost];
    NSString *localizedName = [host localizedName];
    // NSLog(@"%@.\n", host);
    NSLog(@"本机名称为：%@。\n", localizedName);
}

void calSecondsFromMyBirth() {
    /*
     * NSDateComponents是一个构建时间日期的组件。
     */
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:1983];
    [components setMonth:10];
    [components setDay:6];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:5];
    
    /*
     * 构建时间日期对象。
     */
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *dateOfBirth = [calendar dateFromComponents:components];
    
    /*
     * 计算当前时间日期距上面构建的时间日期对象的时间间隙（以秒为单位）。
     */
    printf("%.0fseconds.\n", [[[NSDate alloc] init] timeIntervalSinceDate:dateOfBirth]);
}

//void nsstringTest();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // NSLog(@"Hello, World!");
        /*
         * NSDate：接收方（receiver），指针，指向接收消息的对象的地址。
         * date：方法名/选择器（selector），要触发的方法的方法名。
         */
        // NSDate *now = [NSDate date];
        
        /*
         * alloc是类方法，用于创建一个类型的实例对象，并返回该对象的指针。
         * init是实例方法，没有经过init的方法虽然存在于内存中，但是无法接收消息。
         */
        // NSDate *now = [[NSDate alloc] init];
        
/*
        NSLog(@"This NSDate object lives at %p.\n", now);
        NSLog(@"The date is: %@.\n", now);// “@”格式说明符会输出对象的描述信息。
        NSLog(@"It has been %f seconds since the start of 1970.\n", [now timeIntervalSince1970]);
        
        // showHostName();
        
        NSLog(@"In 1000000 seconds it will be %@.\n", [now dateByAddingTimeInterval:1000000]);
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSLog(@"%@.\n", calendar);
        NSLog(@"My calendar is %@.\n", [calendar calendarIdentifier]);
        NSLog(@"This is day %lu of the month.\n", [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now]);
 */
        
        // calSecondsFromMyBirth();
        
        // nsstringTest();
        
        // searchStringCaseInsensitive(@"ling,Chong", @"cho");
        
        // charStar2NSString();
        
        // arrayContainerTest();
        
        // showGroceries();
        
        // searchShareWords();
  
/*
         * NSString可以用“==”符号判断两个字符串是否相等，下面这段代码中，s1与s2的内存地址并不相同，但是内容相同，所以“s1 == s2”的结果是0。
*/
        /*
        NSString *s1 = @"凌冲";
        NSString *s2 = @"凌";
        s2 = [s2 stringByAppendingString:@"冲"];
        NSLog(@"%d", s1 == s2);
        NSLog(@"%p", s1);
        NSLog(@"%p", s2);
        */
        
        /*
        LCEmployee *mikey = [[LCEmployee alloc] init];
        NSLog(@"%@", mikey);
        [mikey setHeightInMeters:1.85];
        [mikey setWeightInMeters:87.5];
        mikey.employeeID = 0;
        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        NSLog(@"mikey的身高为%.2f米，体重为%.2f千克。", [mikey heightInMeters], [mikey weightInKilos]);
        NSLog(@"mikey的身体体质指标为：%.2f。", [mikey bodyMassIndex]);
        NSLog(@"mikey的ID为%u，入职日期为%@。", mikey.employeeID, mikey.hireDate);
         */
        
        /*
        LCStockHolding *stockHolding1 = [[LCStockHolding alloc] initWithSerial:0];
        [stockHolding1 setPurchaseSharePrice:30];
        [stockHolding1 setCurrentSharePrice:35];
        [stockHolding1 setNumberOfShare:90];
        
        LCStockHolding *stockHolding2 = [[LCStockHolding alloc] initWithSerial:1];
        [stockHolding2 setPurchaseSharePrice:39];
        [stockHolding2 setCurrentSharePrice:40];
        [stockHolding2 setNumberOfShare:130];
        
        LCForeignStockHolding *stockHolding3 = [[LCForeignStockHolding alloc] init];
        stockHolding3.purchaseSharePrice = 22;
        stockHolding3.currentSharePrice = 23;
        stockHolding3.numberOfShare = 300;
        stockHolding3.conversionRate = 1.2;
        
        NSMutableArray *stockHoldingList = [[NSMutableArray alloc] init];
        [stockHoldingList addObject:stockHolding1];
        [stockHoldingList addObject:stockHolding2];
        [stockHoldingList addObject:stockHolding3];
        for (LCStockHolding *item in stockHoldingList) {
            NSLog(@"%d: %.2f %.2f", item.serial, [item costInDollars], [item valueInDollars]);
        }
        */
        
        /*
         * 如果采用下面的赋值方式：
         * NSMutableString *label = @"";
         * 则@"凌冲"为一个NSString类型的字符串，这个字符串是不可变的，如果调用：
         * [label appendString:@"1"];
         * 会报“Attempt to mutate immutable object with appendString:”错误。
         * 因此，如果要创建一个可变字符串，需要使用下面的方法：
         * NSMutableString *label = [[NSMutableString alloc] initWithString:@"凌冲"];
         */
        /*
        NSMutableString *label = [[NSMutableString alloc] initWithString:@"凌冲"];
        LCAsset *asset = [[LCAsset alloc] init];
        asset.label = label;// label是可变字符串，asset.label是一个不可变字符串，对label的修改不会影响到label（因为asset.label的属性中有copy特性）。
        [label appendString:@"1"];
        NSLog(@"%@", label);
        NSLog(@"%@", asset.label);
         */
    }
    return 0;
}




















