//
//  PanGestureViewController.m
//  GestureTable
//
//  Created by JSH on 2020/9/19.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "PanGestureViewController.h"

@interface PanGestureViewController ()

@end

@implementation PanGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    UIImageView * new_image_view = [[UIImageView alloc ]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.productImageView = new_image_view;
    new_image_view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:new_image_view];
    
    
    //    平移
    self.productImageView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [panGesture setMinimumNumberOfTouches:1]; // 识别的触摸手指数量
    [panGesture setMaximumNumberOfTouches:1];
    [self.productImageView addGestureRecognizer:panGesture];
    [self drawLine];
}

- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
{
    UIView *view = self.productImageView;
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) { // 判断手势刚开始或改变的过程中
        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
//        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
        [view setFrame:CGRectMake(100, 100, view.frame.size.width + translation.x, view.frame.size.height + translation.y)];

        [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
    }
}

#pragma mark 绘制直线
- (void)drawLine{

    //获取上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();

    //创建路径，并设置为可变路径
    CGMutablePathRef mutablePath = CGPathCreateMutable();

    /*
     *设置路径上的点
     *设置路径的起始点
     *mutablePath 需要添加起始点的可变路径
     *还有transform 坐标系的变化
     **/
    CGPathMoveToPoint(mutablePath, NULL, 50, 50);

    /*
     *向路径中添加点
     */
    CGPathAddLineToPoint(mutablePath, NULL, 106, 100);
    CGPathAddLineToPoint(mutablePath, NULL, 222, 140);
    CGPathAddLineToPoint(mutablePath, NULL, 100, 200);
    CGPathAddLineToPoint(mutablePath, NULL, 250, 50);
    CGPathAddLineToPoint(mutablePath, NULL, 50, 190);

    /*
     *封闭路径，将起点和终点连接起来
     **/
    CGPathCloseSubpath(mutablePath);

    /*设置绘制的属性*
     *1.线条分段的颜色
     *2.设置图形的填充颜色
     *3.设置线条的宽度
     *4.设置线条分段连接点的样式
     **/
    CGContextSetStrokeColorWithColor(contextRef, [UIColor greenColor].CGColor);
    CGContextSetFillColorWithColor(contextRef, [UIColor cyanColor].CGColor);
    CGContextSetLineWidth(contextRef, 2);
    CGContextSetLineJoin(contextRef, kCGLineJoinRound);

    /*开始绘制路径
     *1.将创建好的路径添加到上下文中
     *2.在上下文中绘制已经添加的路径
     *CGPathDrawingMode mode 绘制模式
     **/
    CGContextAddPath(contextRef, mutablePath);
    CGContextDrawPath(contextRef, kCGPathFillStroke);

    /*
     *最后销毁create函数创建的变量，因为在CG框架中，所有使用create函数创建的变量都需要手动来销毁
     */
    CGPathRelease(mutablePath);

}

@end
