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
#include "LCPortfolio.h"
#include "LCChapter24.h"
#include "LCChapter25.h"
#include "LCLogger.h"

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

typedef void(^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

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
        
        /*
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        for (int i= 0; i < 10; ++i) {
            LCEmployee *employee = [[LCEmployee alloc] init];
            [employee setWeightInMeters:90 + i];
            [employee setHeightInMeters:1.8 - i / 10.0];
            employee.employeeID = i;
            
            [employees addObject:employee];
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; ++i) {
            LCAsset *asset = [[LCAsset alloc] init];
            
            asset.label = [NSString stringWithFormat:@"Laptop %d", i];
            asset.resaleValue = i * 17;
            
            NSUInteger randomIndex = random() % [employees count];
            [[employees objectAtIndex:randomIndex] addAsset:asset];
            [allAssets addObject:asset];
        }
        
        // [[employees objectAtIndex:1] removeAssets:0];
        
        NSLog(@"Employee: %@", employees);
        NSLog(@"Giving up ownership of one employee.");
        // 删除了索引为5的LCEmployee对象，该对象会被立即释放，相应的的dealloc方法会被调用，同时，其成员变量assets（NSArray类型）对象会被释放且相应的dealloc
        // 方法也会被调用。
        [employees removeObjectAtIndex:5];
        NSLog(@"%@", allAssets);
        NSLog(@"Giving up ownership of other employees.");
        // 当employees对象被设置为nil时，employees对象会被释放，其中的元素（LCEmployee对象）也会被依次释放，但即使没有下面这条语句，在程序结束时也会释放，所
        // 不同的是：如果没有@autoreleasepool关键字或使用{}将所有语句括起来，会在跳出这两种情况的作用域时释放，否则，employees的释放要等到程序彻底结束时才会释
        // 放。
        employees = nil;
        // sleep(100);
        */
        
        /*
        LCPortfolio *portfolio = [[LCPortfolio alloc] init];
        NSMutableArray *stockHoldings = [[NSMutableArray alloc] init];
        [portfolio setHoldings:stockHoldings];
        
        LCStockHolding *stockHolding1 = [[LCStockHolding alloc] initWithSerial:0];// heap1。
        stockHolding1.currentSharePrice = 22;
        stockHolding1.numberOfShare = 40;
        stockHolding1.symbol = @"xyz";
        
        LCForeignStockHolding * stockHolding2 = [[LCForeignStockHolding alloc] initWithSerial:1];// heap2。
        stockHolding2.currentSharePrice = 23;
        stockHolding2.numberOfShare = 39;
        stockHolding2.symbol = @"abc";
        
        [portfolio addHolding:stockHolding1];
        [portfolio addHolding:stockHolding2];
        
        NSLog(@"%.2f", [portfolio totalValue]);
        [portfolio removeHoldings:1];
        
        // stockHolding1与stockHolding2也会分别引用分配的堆内存heap1与heap2，此时，heap1与heap2的ARC应分别为1，这里设置为nil可以
        // 分别将heap1与heap2的ARC降为0，lCStockHolding的dealloc方法此时会被调用。
        stockHolding1 = nil;
        stockHolding2 = nil;
        
        portfolio = nil;
        */
        
        /*
        NSMutableSet *set = [[NSMutableSet alloc] init];
        LCChapter24 *chapter24_1 = [[LCChapter24 alloc] init];
        LCChapter24 *chapter24_2 = [[LCChapter24 alloc] init];
        [set addObject:chapter24_1];
        BOOL isContained = [set containsObject:chapter24_2];
        if (isContained == true) {
            NSLog(@"Yes.");
        } else {
            NSLog(@"No.");
        }
        */
        
        /*
        char* string = "ab";
        printf("%zu\n", strlen(string));
         */
        
        /*
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode];
        NSLog(@"本地货币单位：%@", currency );
         */
        
        /*
        NSLog(@"%@", MyName);
        
        NSLog(@"%d", ISMAX(1, 5));
        
        LCChapter25 *lcChapter25 = [[LCChapter25 alloc] init];
        lcChapter25.blenderSpeed = BlenderSpeedChop;
        NSLog(@"%d", lcChapter25.blenderSpeed);
         */
        
        /*
        NSMutableString *content = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; ++i) {
            [content appendString:@"凌冲\n"];
        }
        NSError *error;
        BOOL result = [content writeToFile:@"/tmp/personal/lingchong.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (result) {
            NSLog(@"已向/tmp/lingchong.txt写入数据。");
        } else {
            NSLog(@"向/tmp/personal/linghchong.txt写入数据失败：%@", [error localizedDescription]);
        }
         */
        
        /*
        NSError *error;
        NSString *content = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf" encoding:NSUTF8StringEncoding error:&error];
        if (!content) {
            NSLog(@"读取文件失败，错误原因：%@", [error localizedDescription]);
        } else {
            NSLog(@"/etc/resolv.conf文件内容为：%@", content);
        }
         */
        
        /*
        NSURL *url = [NSURL URLWithString:@"http://pic25.photophoto.cn/20121216/0010023956779853_b.jpg"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];// NSData的默认大小为256KB。
        if (!data) {
            NSLog(@"获取图片失败，错误原因：%@", [error localizedDescription]);
        }
        
        NSLog(@"获取图片成功，文件大小为%lu个字节。", [data length]);
        BOOL written = [data writeToFile:@"/tmp/google.png" options:NSDataWritingAtomic error:&error];
        if (!written) {
            NSLog(@"写入图片到磁盘失败，错误原因：%@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"下载与写入文件成功！");
        
        data = [NSData dataWithContentsOfFile:@"/tmp/google.png" options:0 error:&error];
        NSLog(@"%@", data);
        NSLog(@"%lu", [data length]);
         */
        
        /*
        NSArray *directories = NSSearchPathForDirectoriesInDomains(NSMoviesDirectory, NSUserDomainMask, YES);
        for (NSString *item in directories) {
            NSLog(@"%@", item);
        }
        */
        
        /*
        LCLogger *logger = [[LCLogger alloc] init];
        __unused NSTimer *timer =
                [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:true];
        NSLog(@"%@", timer);
        */
        
        /*
        LCLogger *logger = [[LCLogger alloc] init];
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
         */
        
        /*
        LCLogger *logger = [[LCLogger alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoneChange:) name:NSSystemTimeZoneDidChangeNotification object:nil];
         */
        
        // [[NSRunLoop currentRunLoop] run];
        
        /*
        NSArray *originalStrings = @[@"Stephen Curry", @"Ling Chong"];
        NSLog(@"Original Strings: %@", originalStrings);
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        NSArray *vowelStrings = @[@"a", @"e", @"i", @"o", @"u"];
         */
        
        // 声明一个block变量。
        // void是block变量的返回值，^符号说明该变量（devowelizer）是一个block对象，devowelizer时block变量的名称，id、NSInteger、BOOL *是block变量的三个实参。
        // block对象的实质有点像匿名函数。
        // void (^devowelizer)(id, NSUInteger, BOOL *);
        
        /*
        ArrayEnumerationBlock devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            if ([string rangeOfString:@"i" options:NSCaseInsensitiveSearch].location != NSNotFound) {
                *stop = true;
                return;
            }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            for (NSString *item in vowelStrings) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:item withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            [devowelizedStrings addObject:newString];
        };*/
        
        /*
        [originalStrings enumerateObjectsUsingBlock:^(id string, NSUInteger idx, BOOL *stop) {
            if ([string rangeOfString:@"i" options:NSCaseInsensitiveSearch].location != NSNotFound) {
                *stop = true;
                return;
            }
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            for (NSString *item in vowelStrings) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:item withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            [devowelizedStrings addObject:newString];
        }];
        NSLog(@"The new strings is: %@", devowelizedStrings);
         */
        
        /*
        // 声明Block变量。
        double (^divBlock)(double, double);
        
        // 对Block变量赋值。
        divBlock = ^(double dividend, double divisor) {
            return dividend / divisor;
        };
        
        // 使用Block变量。
        NSLog(@"%.2f", divBlock(18, 2));
         */
        
        /*
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification object:nil queue:nil usingBlock:^    (NSNotification *note) {
            NSLog(@"The system time zone has changed.");
        }];
        
        [[NSRunLoop currentRunLoop] run];
         */
        
        /*
        NSURL *url = [NSURL URLWithString:@"http://pic25.photophoto.cn/20121216/0010023956779853_b.jpg"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];// NSData的默认大小为256KB。
        if (!data) {
            NSLog(@"获取图片失败，错误原因：%@", [error localizedDescription]);
            return 1;
        }
        
        NSMutableArray *root = [[NSMutableArray alloc] init];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:data forKey:@"NSData"];
        [dic setObject:[NSDate date] forKey:@"NSDate"];
        [dic setObject:[NSNumber numberWithInt:1] forKey:@"int"];
        [dic setObject:[NSNumber numberWithDouble:2.0] forKey:@"double"];
        [dic setObject:[NSNumber numberWithBool:true] forKey:@"BOOL"];
        [root addObject:dic];
        
        [root writeToFile:@"/tmp/1.plist" atomically:true];
        NSLog(@"写入文件完毕。");
         */
        
        __unused NSArray *plist = [NSArray arrayWithContentsOfFile:@"/tmp/1.plist"];
        NSLog(@"读取文件成功。");
    }
    return 0;
}


























