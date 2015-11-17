//
//  CustomCell.m
//  Timer
//
//  Created by 任子丰 on 15/11/17.
//  Copyright © 2015年 任子丰. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()
@property (weak, nonatomic) IBOutlet UIView *refreshView;

@end

@implementation CustomCell

- (void)awakeFromNib {
    // Initialization code
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refresh:)];
    [self.refreshView addGestureRecognizer:tapGR];
}

- (void)refresh:(UITapGestureRecognizer *)recognizer
{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
