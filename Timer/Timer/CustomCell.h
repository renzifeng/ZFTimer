//
//  CustomCell.h
//  Timer
//
//  Created by 任子丰 on 15/11/17.
//  Copyright © 2015年 任子丰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RefreshBlock)(void);

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (copy, nonatomic) RefreshBlock refreshBlock;
@end
