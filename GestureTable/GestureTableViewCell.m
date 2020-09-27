//
//  GestureTableViewCell.m
//  GestureTable
//
//  Created by JSH on 2020/9/12.
//  Copyright © 2020 JSH. All rights reserved.
//

#import "GestureTableViewCell.h"

@implementation GestureTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *cellName = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 100)];
        self.cellName = cellName;
        [self.contentView addSubview:cellName];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setCellInfo:(GestureModel *)gestrue
{
    [self.cellName setText:gestrue.gestureName];
}
@end
