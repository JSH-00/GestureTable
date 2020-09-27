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
    
    UILabel * newLabel = [[UILabel alloc ]initWithFrame:CGRectMake(100, 100, 180, 200)];
    self.productLable = newLabel;
    newLabel.backgroundColor = [UIColor redColor];
    newLabel.numberOfLines = 0;
    [self.view addSubview:newLabel];
    [self.productLable setText:@"左扫"];
    self.productLable.userInteractionEnabled = YES;
    
    UISwipeGestureRecognizer * swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft; // 默认为右扫
    [self.productLable addGestureRecognizer:swipeGesture];
    
    UISwipeGestureRecognizer * swipeGestureBlue = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeView:)];
    [self.view addGestureRecognizer:swipeGestureBlue]; // 默认为右扫
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
