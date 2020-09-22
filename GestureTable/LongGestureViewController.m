//
//  LongGestureViewController.m
//  GestureTable
//
//  Created by JSH on 2020/9/21.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "LongGestureViewController.h"

@interface LongGestureViewController ()
@property (nonatomic,weak)UILabel * changeLabel;
@end

@implementation LongGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    UIImageView * new_image_view = [[UIImageView alloc ]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.productImageView = new_image_view;
    new_image_view.backgroundColor = [UIColor redColor];
    [self.view addSubview:new_image_view];

    self.productImageView.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongView:)];
    longGesture.minimumPressDuration = 0.2;
    [self.productImageView addGestureRecognizer:longGesture];

    UILabel * change_lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 300, 200)];
    self.changeLabel = change_lable;
    change_lable.numberOfLines = 2;
    [change_lable setText:@"请长按红色方块"];
    [self.view addSubview:change_lable];
}

- (void)LongView:(UILongPressGestureRecognizer *)longPress
{

    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"longPressBegan");
        [self.changeLabel setText:@"longPressBegan"];

    }else if (longPress.state == UIGestureRecognizerStateChanged){
        NSLog(@"longPressChange");
        [self.changeLabel setText:@"longPressChange"];

    }else if (longPress.state == UIGestureRecognizerStateEnded){
        NSLog(@"end");
        [self.changeLabel setText:@"end\n请长按红色方块"];
    }
}
@end
