//
//  XYURLSessionManager.m
//  tableView
//
//  Created by wuw on 2017/6/9.
//  Copyright © 2017年 Kingnet. All rights reserved.
//

#import "XYURLSessionManager.h"

@interface XYURLSessionManager ()

@property (nonatomic, strong) NSURLSession *session;

@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfiguration;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@property (nonatomic, strong) NSLock *lock;

@end

@implementation XYURLSessionManager

- (instancetype)init{
    return [self initWithSessionConfiguration:nil];
}

- (instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)configuration{
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
