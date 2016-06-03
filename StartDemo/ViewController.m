//
//  ViewController.m
//  StartDemo
//
//  Created by 李斌 on 15/12/14.
//  Copyright © 2015年 李斌. All rights reserved.
//

#import "ViewController.h"
#import "StartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [StartView sizeForImage];
    StartView *start = [[StartView alloc]initWithFrame:CGRectMake(50, 60, size.width    , size.height)];
    start.backgroundColor = [UIColor redColor];
    [self.view addSubview:start];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
