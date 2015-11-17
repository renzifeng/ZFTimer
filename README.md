# ZFTimer
每个cell记录一条距离上次刷新的时间
### 效果演示：
![image](https://github.com/renzifeng/ZFTabBar/raw/master/ZFTimer.gif)

定义一个NSTimer，每秒钟[self.tableView reloadData];

``` objc
//核心代码，计算和当前时间的差值
- (NSString *)timeRemainingString 
{
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
```
# 期待
- 如果在使用过程中遇到BUG，或发现功能不够用，希望你能Issues我
- 如果觉得好用请Star!
- 谢谢!