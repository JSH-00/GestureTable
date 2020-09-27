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
    UIImageView * newImageView = [[UIImageView alloc ]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.productImageView = newImageView;
    newImageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:newImageView];

    self.productImageView.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongView:)];
    longGesture.minimumPressDuration = 0.2;
    [self.productImageView addGestureRecognizer:longGesture];

    UILabel * changeLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 300, 200)];
    self.changeLabel = changeLable;
    changeLable.numberOfLines = 2;
    [changeLable setText:@"请长按红色方块"];
    [self.view addSubview:changeLable];
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
