//
//  DrawView.m
//  JXCircleSlider
//
//  Created by xiekang on 2018/8/1.
//  Copyright © 2018年 BFMobile. All rights reserved.
//

#import "DrawView.h"
#import "SingleChartView.h"
@interface DrawView()
@property(strong,nonatomic)NSMutableArray *lineArr;
/** Chart bottom border, co-linear with the x-axis. */
@property (nonatomic) CAShapeLayer * chartBottomLine;

/** Chart bottom border, level separator-linear with the x-axis. */
@property (nonatomic) CAShapeLayer * chartLevelLine;

/** Chart left border, co-linear with the y-axis. */
@property (nonatomic) CAShapeLayer * chartLeftLine;

@property (nonatomic) CGFloat chartMarginTop;
@property (nonatomic) CGFloat chartMarginLeft;
@end

@implementation DrawView


-(instancetype)initWithFrame:(CGRect)frame dataArr:(NSMutableArray *)dataArr;
{
    
     if ([super initWithFrame:frame]) {
         self.backgroundColor = [UIColor clearColor];
         _chartMarginLeft = 251;
         _chartMarginTop = 200;
         _lineArr = dataArr;
     }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
      [super drawRect:rect];
    _chartBottomLine = [CAShapeLayer layer];
    _chartBottomLine.lineCap      = kCALineCapButt;
    _chartBottomLine.fillColor    = [[UIColor whiteColor] CGColor];
    _chartBottomLine.lineWidth    = 4.0;
    _chartBottomLine.strokeEnd    = 0.0;
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline moveToPoint:CGPointMake(0, _chartMarginTop)];
    [progressline addLineToPoint:CGPointMake(_chartMarginLeft,  _chartMarginTop)];
    [progressline setLineWidth:1.0];
    [progressline setLineCapStyle:kCGLineCapSquare];
    _chartBottomLine.path = progressline.CGPath;
    _chartBottomLine.strokeColor = [[UIColor redColor] CGColor];;
    _chartBottomLine.strokeEnd = 2.0;
    [self.layer addSublayer:_chartBottomLine];
    
    
    
    _chartLeftLine = [CAShapeLayer layer];
    _chartLeftLine.lineCap      = kCALineCapButt;
    _chartLeftLine.fillColor    = [[UIColor greenColor] CGColor];
    _chartLeftLine.lineWidth    = 4.0;
    _chartLeftLine.strokeEnd    = 0.0;
    
    UIBezierPath *progressLeftline = [UIBezierPath bezierPath];
    [progressLeftline moveToPoint:CGPointMake(0, 10)];
    [progressLeftline addLineToPoint:CGPointMake(0,  _chartMarginTop)];
    [progressLeftline setLineWidth:1.0];
    [progressLeftline setLineCapStyle:kCGLineCapSquare];
    _chartLeftLine.path = progressLeftline.CGPath;
    _chartLeftLine.strokeColor = [[UIColor cyanColor] CGColor];
    _chartLeftLine.strokeEnd = 2.0;
    [self.layer addSublayer:_chartLeftLine];
    
    
    
    SingleChartView *single = [[SingleChartView alloc]initWithFrame:CGRectMake(0, 0, 4, 100)];
    [self addSubview:single];

}


@end
