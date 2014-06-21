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

- (void)loadDataSource {
    self.dataSource = (NSMutableArray *)@[@"Test", @"Demo", @"Test", @"Demo", @"Test", @"Demo", @"Test", @"Demo", @"Test", @"Demo", @"Test", @"Demo", @"Test", @"Demo"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadDataSource];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.top = ([XHFoundationCommon isIOS7] ? 64 : 0);
    self.tableView.contentInset = edgeInsets;
    self.tableView.scrollIndicatorInsets = edgeInsets;
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
    cell.imageView.image = [UIImage imageNamed:@"meicon"];
    cell.textLabel.text = @"这里是Demo";
    
    return cell;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[[[self class] alloc] init] animated:YES];
}

@end
