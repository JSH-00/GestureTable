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
    
    UIImageView * newImageView = [[UIImageView alloc ]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.productImageView = newImageView;
    newImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:newImageView];
    self.productImageView.userInteractionEnabled = YES;
    
    UIRotationGestureRecognizer * rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationView:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
}

- (void)rotationView:(UIRotationGestureRecognizer *)gestrue
{
    NSLog(@"%f",gestrue.rotation);
    self.productImageView.transform = CGAffineTransformRotate(self.productImageView.transform, gestrue.rotation);
    // 复位
    gestrue.rotation = 0;
}
@end
