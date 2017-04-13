//
//  chapter17.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/11.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>

void arrayContainerTest() {
    NSDate *now = [NSDate date];
    NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
    NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
  
    /*
     * NSArray为静态数组，静态数组在初始化之后不可以对数组项进行增加、删除或调序，只能进行存取。
     */
/*
    NSArray *dateList = @[now, tomorrow, yesterday];
    NSLog(@"今天：%@\n明天：%@\n昨天：%@", dateList[0], dateList[1], dateList[2]);
    NSLog(@"dateList数组中对象数量：%lu。", [dateList count]);
    for (NSDate *item in dateList) {
        NSLog(@"%@", item);
    }
 */
   
    /*
     * NSMutableArray为可变数组，可变数组在初始化之后可以对数组项进行增加、删除或调序。
     */
/*
    NSMutableArray *dateList = [NSMutableArray array];
    [dateList addObject:now];
    [dateList addObject:tomorrow];
    [dateList insertObject:yesterday atIndex:0];
    for (NSDate *item in dateList) {
        NSLog(@"%@", item);
    }
    [dateList removeObject:dateList[0]];
    [dateList removeObject:tomorrow];
    for (NSDate *item in dateList) {
        NSLog(@"%@", item);
    }
    
    NSLog(@"%@", yesterday);
    NSLog(@"%@", tomorrow);
 */
    
    /*
     * 旧式数组声明方法。
     */
    NSArray *dateList = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];
    NSLog(@"%@", [dateList objectAtIndex:0]);
}

void showGroceries() {
    NSMutableArray *groceries = [NSMutableArray array];
    [groceries addObject:@"一块面包"];
    [groceries addObject:@"一瓶牛奶"];
    [groceries addObject:@"一片黄油"];
    NSLog(@"我的购物清单是：");
    for (NSString *item in groceries) {
        NSLog(@"%@", item);
    }
}

void searchShareWords() {
    NSString *namesInProperNamesFile = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames" encoding:NSUTF8StringEncoding error:NULL];
    NSString *namesInWordsFile = [NSString stringWithContentsOfFile:@"/usr/share/dict/words" encoding:NSUTF8StringEncoding error:NULL];
    NSArray *namesInProperNamesList = [namesInProperNamesFile componentsSeparatedByString:@"\n"];
    NSArray *namesInWordsList = [namesInWordsFile componentsSeparatedByString:@"\n"];
    int count = 0;
    for (NSString *itemProperName in namesInProperNamesList) {
        for (NSString *itemWords in namesInWordsList) {
            NSRange match = [itemWords rangeOfString:itemProperName options:NSCaseInsensitiveSearch];
            if ((match.location != NSNotFound) && (itemWords == itemProperName)) {
                NSLog(@"%d-words: %@  proper name: %@", ++count, itemWords, itemProperName);
                break;
            }
        }
    }
}
























