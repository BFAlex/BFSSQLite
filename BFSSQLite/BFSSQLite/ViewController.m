//
//  ViewController.m
//  BFSSQLite
//
//  Created by 刘玲 on 2019/2/19.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import "ViewController.h"
#import "BFsSQLiteAssistant.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // SQLite
    [self testSQLite];
}

- (void)testSQLite {
    
//    [self addModel];
    [self queryModel];
}

- (void)addModel {
    
    BFsSQLiteAssistant *dbAssistant = [BFsSQLiteAssistant sharedInstanced];
    // 增
    Teacher *teacherModel = [dbAssistant createModel:@"Teacher"];
    NSLog(@"model: %@", teacherModel);
    [teacherModel setupDefauleStatus];
    NSLog(@"model: %@", teacherModel);
    [dbAssistant saveModel:teacherModel];
}

- (void)queryModel {
    
    BFsSQLiteAssistant *dbAssistant = [BFsSQLiteAssistant sharedInstanced];
    // 查
    NSError *error;
    NSPredicate *tPredicate = [NSPredicate predicateWithFormat:@"age=18"];
    NSArray *resultArr = [dbAssistant query:@"Teacher" predicate:tPredicate error:&error];
    NSLog(@"result number:%ld", resultArr.count);
    for (Teacher *t in resultArr) {
        NSLog(@"teacher:%@", t);
    }
}


@end
