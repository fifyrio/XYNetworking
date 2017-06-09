//
//  MainViewController.m
//  tableView
//
//  Created by 吴伟 on 15/10/9.
//  Copyright © 2015年 com.weizong. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<NSURLSessionDelegate>

@property (atomic, copy) NSString *name;

@end

@implementation MainViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.name = @"";
    
    
}

#pragma mark - Initialize


#pragma mark - Actions
/*
 *测试原子性
 */
- (IBAction)onclickAtomic:(id)sender {
    WS(weakSelf);
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        weakSelf.name = [weakSelf.name stringByAppendingString:@" will "];
        NSLog(@"name:%@", weakSelf.name);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        weakSelf.name = [weakSelf.name stringByAppendingString:@" javion "];
        NSLog(@"name:%@", weakSelf.name);
    }];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue setName:@"MyQueue"];
    [queue addOperations:@[op1, op2] waitUntilFinished:NO];
}

- (IBAction)onclickDataTask:(id)sender {
    NSString *urlStr = @"http://userapi.hiweixiu.com/fault/default-module-name?ModuleCode=iPhone8%2C1";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue setName:@"will"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:queue];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"1");
    }];
    [task resume];
}
- (IBAction)onclickMultiRequest:(id)sender {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue setName:@"will's requests"];
    NSString *urlStr = @"http://userapi.hiweixiu.com/fault/default-module-name?ModuleCode=iPhone8%2C1";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:queue];
    
    NSURLSessionTask *task1 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"1");
    }];
    [task1 resume];
    
    NSURLSessionTask *task2 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"2");
    }];
    [task2 resume];
    
    NSURLSessionTask *task3 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"3");
    }];
    [task3 resume];
    
    NSURLSessionTask *task4 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"4");
    }];
    [task4 resume];
    
    NSURLSessionTask *task5 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"5");
    }];
    [task5 resume];
    
    NSURLSessionTask *task6 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"6");
    }];
    [task6 resume];
    
    NSURLSessionTask *task7 = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"7");
    }];
    [task7 resume];
}

#pragma mark - Getters

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
