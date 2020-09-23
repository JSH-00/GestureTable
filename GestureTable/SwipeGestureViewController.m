//
//  DetailGestureViewController.m
//  GestureTable
//
//  Created by JSH on 2020/9/17.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "SwipeGestureViewController.h"

@interface SwipeGestureViewController ()
@property (nonatomic ,weak) UILabel * productLable;
@end

@implementation SwipeGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UILabel * new_label = [[UILabel alloc ]initWithFrame:CGRectMake(100, 100, 180, 200)];
    self.productLable = new_label;
    new_label.backgroundColor = [UIColor redColor];
    new_label.numberOfLines = 0;
    [self.view addSubview:new_label];
    [self.productLable setText:@"左扫"];
    self.productLable.userInteractionEnabled = YES;
    
    UISwipeGestureRecognizer * swipe_gesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
    swipe_gesture.direction = UISwipeGestureRecognizerDirectionLeft; // 默认为右扫
    [self.productLable addGestureRecognizer:swipe_gesture];
    
    UISwipeGestureRecognizer * swipe_gesture_blue = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
    [self.view addGestureRecognizer:swipe_gesture_blue]; // 默认为右扫
}

- (void)swipeView:(UISwipeGestureRecognizer *)gesture
{
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self.productLable setText:@"左扫成功！！\n可右扫蓝色区域"];
    }
    else if (gesture.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self.productLable setText:@"右扫成功！！\n可左扫红色区域"];
    }
}
@end
