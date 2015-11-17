//
//  ViewController.m
//  Timer
//
//  Created by 任子丰 on 15/11/12.
//  Copyright © 2015年 任子丰. All rights reserved.
//

#import "ViewController.h"
#import "MyAction.h"
#import "CustomCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *modelArr;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    [self.view addSubview:self.tableView];
    
}
-(void)dealloc
{
    self.timer = nil;
}
// schedule timer on viewDidAppear
// invalidate on viewWillDisappear
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}

//timer Action
- (void)timerFired:(NSTimer *)timer {
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:nil options:nil].lastObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MyAction *myAction = [self.modelArr objectAtIndex:indexPath.row];
    __weak MyAction *weakAction = myAction;
    __weak ViewController *weakSelf = self;
    cell.refreshBlock = ^ {
        weakAction.dueDate = [NSDate date];
        [weakSelf.tableView reloadData];
    };
    cell.timerLabel.text = [myAction timeRemainingString];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSMutableArray *)modelArr
{
    if (_modelArr == nil) {
        _modelArr = @[].mutableCopy;
        for (int i = 0; i < 20; i++) {
            MyAction *myAction = [[MyAction alloc] init];
            [_modelArr addObject:myAction];
        }
    }
    return _modelArr;
}

@end
