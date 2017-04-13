//
//  chapter16.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/11.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <readline/readline.h>
#import <Foundation/Foundation.h>
#include "chapter16.h"

void nsstringTest() {
    /*
     * @表示根据给定的字面量字符串创建一个NSString对象，得到的对象称为NSString字面量实例或NSString字面量。
     */
/*
    NSString *pName = @"凌冲\n";
    NSLog(@"%@", pName);
    NSString *pLogan = @"I \u2661 New York.\n";
    NSLog(@"%@", pLogan);
    NSString *pDateString = [NSString stringWithFormat:@"The date is %@", [[NSDate alloc] init]];
    NSLog(@"%@", pDateString);
 */
    
    NSString *pName = @"凌冲";
    NSLog(@"%lu", [pName length]);
    
    NSString *pFirstName1 = @"Ling";
    NSString *pFirstName2 = @"ling";
    NSLog(@"%@", [pFirstName1 isEqualToString:pFirstName2] ? @"true" : @"false");
    NSLog(@"%@", [[pFirstName1 uppercaseString] isEqualToString:[pFirstName2 uppercaseString]] ? @"true" : @"false");
}

void searchString(NSString *listOfString, NSString *key) {
    NSRange match = [listOfString rangeOfString:key];
    if (match.location == NSNotFound) {
        NSLog(@"%@", @"No match found.");
    } else {
        NSLog(@"\nlength: %lu\nindex: %lu", match.length, match.location);
    }
}

void searchStringCaseInsensitive(NSString *listOfString, NSString *key) {
    NSRange match = [listOfString rangeOfString:key options:NSCaseInsensitiveSearch];
    if (match.location == NSNotFound) {
        NSLog(@"%@", @"No match found.");
    } else {
        NSLog(@"\nlength: %lu\nindex: %lu", match.length, match.location);
    }
}

void charStar2NSString() {
    NSLog(@"%@", @"请输入您的姓名：");
    char *name = readline(NULL);
    NSLog(@"您的姓名：%@", [NSString stringWithUTF8String:name]);
}