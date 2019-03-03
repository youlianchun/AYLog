//
//  AYLog.h
//  AYLog
//
//  Created by YLCHUN on 16/10/26.
//  Copyright © 2016年 ylchun. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *  DEBUG 时候打印
 */
void AYLogv(NSString *format, va_list args) NS_FORMAT_FUNCTION(1,0) NS_NO_TAIL_CALL;

/*!
 *  DEBUG 时候打印
 */
void AYLog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2) NS_NO_TAIL_CALL;
