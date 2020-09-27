//
//  GestureTableViewController.m
//  GestureTable
//
//  Created by JSH on 2020/9/12.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "GestureTableViewController.h"
#import "GestureTableViewCell.h"
#import "GestureModel.h"

@interface GestureTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak)UITableView * gestureTable;
@property (nonatomic ,strong)NSMutableArray<GestureModel* > * gestureArray;
- (void)reloadGestureModel;
@end

@implementation GestureTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadGestureModel];
    UITableView * gestureTable = [UITableView new];
    [gestureTable registerClass:[GestureTableViewCell class] forCellReuseIdentifier:@"TcellID"];// 注册 GestureTableViewCell
    self.gestureTable = gestureTable;
    self.view.backgroundColor = [UIColor blueColor];
    gestureTable.delegate = self;
    gestureTable.dataSource = self;
    gestureTable.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    [self.view addSubview:gestureTable];
}

#pragma mark - Table view data source
- (void)reloadGestureModel
{
    NSMutableArray * gesture_array = [NSMutableArray new];
    self.gestureArray = gesture_array;
    NSArray * gesture_name = @[@"PanGesture",@"LongPressGesture",@"SwipeGesture",@"RotationGesture"];
    NSArray * gesture_vc = @[@"PanGestureViewController",@"LongGestureViewController",@"SwipeGestureViewController",@"RotationGestureViewController"];
    for (int i = 0; i < gesture_name.count || i < gesture_vc.count; i++) {
        GestureModel * gesture = [GestureModel new];
        gesture.gestureName = [gesture_name objectAtIndex:i];
        gesture.gestureVC = [gesture_vc objectAtIndex:i];
        [self.gestureArray addObject:gesture];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.gestureArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellID = @"TcellID";
    GestureTableViewCell *cell = [self.gestureTable dequeueReusableCellWithIdentifier:cellID]; // 根据注册的 cellID 重用已注册的 cell
    if (nil == cell) {
        cell = [[GestureTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    [cell setCellInfo:[self.gestureArray objectAtIndex:indexPath.row]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    cell.userInteractionEnabled=YES;
    self.gestureTable.allowsSelectionDuringEditing=YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // cell右侧小箭头
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcClassString = [self.gestureArray objectAtIndex:indexPath.row].gestureVC;
    Class gesture_class = NSClassFromString(vcClassString);
    UIViewController *gesture_vc = [[gesture_class alloc] init];
    [self.navigationController pushViewController:gesture_vc animated:YES];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
@end
