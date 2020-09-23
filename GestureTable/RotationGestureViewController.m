//
//  RotationViewController.m
//  GestureTable
//
//  Created by JSH on 2020/9/21.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "RotationGestureViewController.h"

@interface RotationGestureViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic ,weak) UIImageView * productImageView;
@end

@implementation RotationGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    UIImageView * new_image_view = [[UIImageView alloc ]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.productImageView = new_image_view;
    new_image_view.backgroundColor = [UIColor redColor];
    [self.view addSubview:new_image_view];
    self.productImageView.userInteractionEnabled = YES;
    
    UIRotationGestureRecognizer * rotation_gesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationView:)];
    rotation_gesture.delegate = self;
    [self.view addGestureRecognizer:rotation_gesture];
}

- (void)rotationView:(UIRotationGestureRecognizer *)gestrue
{
    NSLog(@"%f",gestrue.rotation);
    self.productImageView.transform = CGAffineTransformRotate(self.productImageView.transform, gestrue.rotation);
    // 复位
    gestrue.rotation = 0;
}
@end
