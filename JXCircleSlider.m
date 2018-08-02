//
//  JXCircleSlider.m
//  JXCircleSlider
//
//  Created by JackXu on 15/6/23.
//  Copyright (c) 2015年 BFMobile. All rights reserved.
//

#import "JXCircleSlider.h"
#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )
#define ToDeg(rad)		( (180.0 * (rad)) / M_PI )
#define SQR(x)			( (x) * (x) )
#define image_width 52
#define image_height 66
@implementation JXCircleSlider{
    CGFloat radius;
    UIImageView *_image;
}

-(id)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        _lineWidth = 5;
        _angle = 280;
        radius = self.frame.size.width/2 - _lineWidth/2 - _lineWidth*2;
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_home_nav"]];
        _image = image;
        [self addSubview:image];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
  
    //1.绘制灰色的背景
    CGPoint aPoints[2];//坐标点
    aPoints[0] =CGPointMake(0, self.frame.size.height/2);//坐标1
    aPoints[1] =CGPointMake(self.frame.size.width, self.frame.size.height/2);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
    CGContextAddLines(context, aPoints, 2);//添加线
    [[UIColor grayColor] setStroke];
    CGContextSetLineWidth(context, _lineWidth);
    CGContextSetLineCap(context, kCGLineCapButt);
    CGContextDrawPath(context, kCGPathStroke);
    
    //2.绘制进度
    CGPoint aPoints2[2];//坐标点
    aPoints2[0] =CGPointMake(0, self.frame.size.height/2);//坐标1
    aPoints2[1] =CGPointMake(self.angle, self.frame.size.height/2);//坐标2
    CGContextAddLines(context, aPoints2, 2);//添加线
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(context, _lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextDrawPath(context, kCGPathStroke);
    
    _image.frame = CGRectMake(self.angle-26, self.frame.size.height/2-image_height, image_width, image_height);
}


-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super beginTrackingWithTouch:touch withEvent:event];
    return YES;
}


-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super continueTrackingWithTouch:touch withEvent:event];
    //获取触摸点
    CGPoint lastPoint = [touch locationInView:self];
    //使用触摸点来移动小块
    
    if ((lastPoint.y-image_height<_image.frame.origin.y-image_height < lastPoint.y+_image.frame.size.height)) {//如果在这条线上就滑动位置来移动
        if (lastPoint.x>0&&lastPoint.x<100) {
            [self movehandle:lastPoint];
            //发送值改变事件
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }


    }
    
   
    return YES;
}

-(void)movehandle:(CGPoint)lastPoint{
    self.angle = lastPoint.x;
    
    //重新绘制
    [self setNeedsDisplay];
}

-(void)changeAngle:(float)angle{
    _angle = angle;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self setNeedsDisplay];
}

//从苹果是示例代码clockControl中拿来的函数
//计算中心点到任意点的角度
static inline float AngleFromNorth(CGPoint p1, CGPoint p2, BOOL flipped) {
    CGPoint v = CGPointMake(p2.x-p1.x,p2.y-p1.y);
    float vmag = sqrt(SQR(v.x) + SQR(v.y)), result = 0;
    v.x /= vmag;
    v.y /= vmag;
    double radians = atan2(v.y,v.x);
    result = ToDeg(radians);
    return (result >=0  ? result : result + 360.0);
}

@end
