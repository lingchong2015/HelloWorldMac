//
//  LCLogger.m
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/19.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import "LCLogger.h"

@interface LCLogger() {
    NSMutableData *_incommingData;
    int _counter;
}

@end

@implementation LCLogger

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];// 使通知中心不拥有观察者——LCLogger实例。
}

- (NSString *)lastTimeString {
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"Created dateFormatter.");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t {
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
    NSLog(@"%d", [[NSThread currentThread] isMainThread]);
}

/*
 * 收到一定字节数的数据后会被调用。
 */
- (void)connection:(nonnull NSConnection *)connection didReceiveData:(nonnull NSData *)data {
    if (_incommingData == nil) {
        _counter = 0;
        _incommingData = [[NSMutableData alloc] init];
    }
    
    NSLog(@"收到了第%d块数据，数据块长度为%lu个字节。", ++_counter, [data length]);
    [_incommingData appendData:data];
}

/*
 * 最后一部分数据处理完毕后会被调用。
 */
- (void)connectionDidFinishLoading:(nonnull NSURLConnection *)connection {
    NSLog(@"获取数据完毕。");
    
    NSString *string = [[NSString alloc] initWithData:_incommingData encoding:NSUTF8StringEncoding];
    NSLog(@"共收到%lu个字节的数据，数据内容为：\n%@", [string length], string);
    
    if (!_incommingData) {
        _incommingData = nil;
    }
}


/*
 * 获取数据失败时会被调用。
 */
- (void)connection:(nonnull NSURLConnection *)connection didFailWithError:(nonnull NSError *)error {
    NSLog(@"连接失败，错误原因为：%@", [error localizedDescription]);
    
    if (!_incommingData) {
        _incommingData = nil;
    }
}

- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed.");
}

@end


































