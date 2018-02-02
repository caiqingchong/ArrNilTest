//
//  NSArray+NilSafe.m
//  NilDictionaryTest
//
//  Created by 张张凯 on 2018/2/1.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "NSArray+NilSafe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"//在NSString类别中交换方法
/*
 __FUNCTION__    输出当前方法
 */

@implementation NSArray (NilSafe)

+ (void)load{
    static dispatch_once_t onceToken;
    //调用原方法以及新方法进行交换，处理崩溃问题。
    dispatch_once(&onceToken, ^{
        //越界崩溃方式一：[array objectAtIndex:1000];
        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeObjectAtIndex:)];
        
        //越界崩溃方式二：arr[1000];   Subscript n:下标、脚注
        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(safeobjectAtIndexedSubscript:)];
    });
}
- (instancetype)safeObjectAtIndex:(NSUInteger)index {
    // 数组越界也不会崩，但是开发的时候并不知道数组越界
    if (index > (self.count - 1)) { // 数组越界
        return nil;
    }else { // 没有越界
        return [self safeObjectAtIndex:index];
    }
}

- (instancetype)safeobjectAtIndexedSubscript:(NSUInteger)index{
    
    if (index > (self.count - 1)) { // 数组越界
        return nil;
    }else { // 没有越界
        return [self safeobjectAtIndexedSubscript:index];
    }
    
}



@end






