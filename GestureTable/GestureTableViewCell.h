//
//  GestureTableViewCell.h
//  GestureTable
//
//  Created by JSH on 2020/9/12.
//  Copyright © 2020 JSH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GestureTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel * cellName;
- (void)setCellInfo:(GestureModel *)gestrue;
@end

NS_ASSUME_NONNULL_END
