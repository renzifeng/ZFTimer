//
//  MyAction.h
//  Timer
//
//  Created by 任子丰 on 15/11/12.
//  Copyright © 2015年 任子丰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAction : NSObject
@property (strong, nonatomic) NSDate *dueDate;
- (NSString *)timeRemainingString;
@end
