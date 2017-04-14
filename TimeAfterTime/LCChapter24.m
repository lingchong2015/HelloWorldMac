//
//  LCChapter24.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/14.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCChapter24.h"

@implementation LCChapter24

- (BOOL)isEqual:(id)object {
    const char *className = object_getClassName(object);
    if (strncmp(className, "LCChapter24", strlen(className))) {
        return false;
    }
    return true;
}

@end
