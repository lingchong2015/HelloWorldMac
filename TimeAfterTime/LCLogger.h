//
//  LCLogger.h
//  TimeAfterTime
//
//  Created by 凌冲 on 17/4/19.
//  Copyright © 2017年 凌冲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCLogger : NSObject
    <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, nullable) NSDate *lastTime;

- (nullable NSString *)lastTimeString;

- (void)updateLastTime:(nonnull NSTimer *)t;

- (void)connection:(nonnull NSURLConnection *)connection didReceiveData:(nonnull NSData *)data;

- (void)connectionDidFinishLoading:(nonnull NSURLConnection *)connection;

- (void)connection:(nonnull NSURLConnection *)connection didFailWithError:(nonnull NSError *)error;

- (void)zoneChange:(nonnull NSNotification *)note;

@end
