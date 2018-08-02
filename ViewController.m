//
//  ViewController.m
//  JXCircleSlider
//
//  Created by JackXu on 15/6/23.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import "ViewController.h"
#import "JXCircleSlider.h"
#import "DrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    JXCircleSlider *slider = [[JXCircleSlider alloc] initWithFrame:CGRectMake(80, 0, 200, 300)];
//    slider.center = self.view.center;
//
//    [slider addTarget:self action:@selector(newValue:) forControlEvents:UIControlEventValueChanged];
//
//    [slider changeAngle:260];
//    [self.view addSubview:slider];
    
    
    NSMutableArray *data = [NSMutableArray array];
    [data addObject:[NSValue valueWithCGPoint:CGPointMake(100, 20)]];
    
     [data addObject:[NSValue valueWithCGPoint:CGPointMake(100, 120)]];
    
     [data addObject:[NSValue valueWithCGPoint:CGPointMake(130, 20)]];
    
     [data addObject:[NSValue valueWithCGPoint:CGPointMake(130, 120)]];
    
     DrawView *slider = [[DrawView alloc] initWithFrame:CGRectMake(80, 50, 200, 300) dataArr:data];
    
    [self.view addSubview:slider];
    
}

-(void)newValue:(JXCircleSlider*)slider{
    NSLog(@"newValue:%d",slider.angle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
