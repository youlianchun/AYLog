//
//  NDLog.m
//  NDLog
//
//  Created by YLCHUN on 16/10/26.
//  Copyright © 2016年 ylchun. All rights reserved.
//

#import "NDLog.h"

void NDLogv(NSString *format, va_list args) {
#if DEBUG
    NSMutableString * message = [[NSMutableString alloc] initWithFormat:format arguments:args];
    NSDate *date = [NSDate date];
    NSMutableString *str = [NSMutableString string];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSString *time = [dateFormatter stringFromDate:date];
    [str appendString:time];
    [str appendString:@" "];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *project = [infoDictionary objectForKey:@"CFBundleExecutable"]; //获取项目名称
    [str appendString:project];
    [str appendString:@"["];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"]; //获取项目版本号
    [str appendString:version];
    [str appendString:@"_"];
    NSString *build = [infoDictionary objectForKey:@"CFBundleVersion"]; //获取项目构造版本号
    [str appendString:build];
    [str appendString:@"] "];
    [str appendString:message];
    printf("%s\n",  [str UTF8String]);
#endif
}

void NDLog(NSString *format, ...) {
#if DEBUG
    va_list argumentList;
    va_start(argumentList, format);
    NSMutableString * message = [[NSMutableString alloc] initWithFormat:format arguments:argumentList];
    va_end(argumentList);
    NDLogv(message, argumentList);
#endif
}
