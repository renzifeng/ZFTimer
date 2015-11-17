//
//  MyAction.m
//  Timer
//
//  Created by 任子丰 on 15/11/12.
//  Copyright © 2015年 任子丰. All rights reserved.
//

#import "MyAction.h"

@implementation MyAction
- (NSString *)timeRemainingString {
    // divide by 60, 3600, etc to make a pretty string with colons
    // just to get things going, for now, do something simple
    NSString *answer;
    if (!self.dueDate) {
        answer = @"今日未刷新";
    }else {
        NSDate *now = [NSDate date];
        NSTimeInterval secondsLeft = [self.dueDate timeIntervalSinceDate:now];
        NSString *timeStr = [self timeFormatted:-secondsLeft];
        answer = [NSString stringWithFormat:@"距离上次刷新\n%@", timeStr];
    }
    return answer;
}

- (NSString *)timeFormatted:(int)totalSeconds
{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}
@end
