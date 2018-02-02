//
//  ViewController.m
//  ArrNilSafeDemo
//
//  Created by 张张凯 on 2018/2/2.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /****************--NSArray--****************/
    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5"];
    NSLog(@"不可变数组越界是否崩溃：%@",arr[10]);
    //    [arr objectAtIndex:10];
    
    
    /****************--NSMutableArray--****************/
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:10];
    [mutArr addObject:@"a"];
    [mutArr addObject:@"n"];
    [mutArr removeObject:@"m"];
    [mutArr addObject:nil];
    /*
     1、索引越界 2、移除索引越界 3、替换索引越界
     */
    NSLog(@"可变数组越界是否崩溃：%@",mutArr[10]);
    [mutArr removeObjectAtIndex:10];
    [mutArr replaceObjectAtIndex:10 withObject:@"zhang"];
    
    NSLog(@"--------mutArr:%@",mutArr);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
