//
//  SingleChartView.m
//  JXCircleSlider
//
//  Created by xiekang on 2018/8/1.
//  Copyright © 2018年 BFMobile. All rights reserved.
//

#import "SingleChartView.h"

@implementation SingleChartView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
  
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor magentaColor].CGColor);
    CGContextFillRect(context, rect);
    
}


@end
