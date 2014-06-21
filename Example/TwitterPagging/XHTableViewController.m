//
//  XHTableViewController.m
//  TwitterPagging
//
//  Created by 曾 宪华 on 14-6-21.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "XHTableViewController.h"

@interface XHTableViewController ()

@end

@implementation XHTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataSource = (NSMutableArray *)@[@"Test", @"Demo", @"Test", @"Demo", @"Test", @"Demo", @"Test", @"Demo"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.top = 64;
    self.tableView.contentInset = edgeInsets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"这里是Demo";
    
    return cell;
}

@end
