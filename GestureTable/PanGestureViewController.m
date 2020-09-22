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


@end
