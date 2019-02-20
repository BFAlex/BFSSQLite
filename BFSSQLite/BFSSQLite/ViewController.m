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
//    [self queryModel];
//    [self deleteModel];
    [self queryModelsSort];
}

- (void)addModel {
    
    BFsSQLiteAssistant *dbAssistant = [BFsSQLiteAssistant sharedInstanced];
    // 增
    for (int i = 0; i < 10; i++) {
        Teacher *teacherModel = [dbAssistant createModel:@"Teacher"];
        [teacherModel setupDefauleStatus];
        NSLog(@"model: %@", teacherModel);
        [dbAssistant saveModel:teacherModel];
    }
}

- (NSArray *)queryModel {
    
    BFsSQLiteAssistant *dbAssistant = [BFsSQLiteAssistant sharedInstanced];
    // 查
    NSError *error;
    NSPredicate *tPredicate;
    tPredicate = [NSPredicate predicateWithFormat:nil];
//    tPredicate = [NSPredicate predicateWithFormat:@"age=18"];
//    tPredicate = [NSPredicate predicateWithFormat:@"name='Mimi'"];
//    tPredicate = [NSPredicate predicateWithFormat:@"age>='18' && age<'28'"];
    
    NSArray *resultArr = [dbAssistant query:@"Teacher" predicate:tPredicate error:&error];
    NSLog(@"result number:%ld", resultArr.count);
    for (Teacher *t in resultArr) {
        NSLog(@"teacher:%@", t);
    }
    
    return resultArr;
}

- (NSArray *)queryModelsSort {
    
    BFsSQLiteAssistant *dbAssistant = [BFsSQLiteAssistant sharedInstanced];
    // 查
    NSError *error;
    
    NSPredicate *tPredicate;
    tPredicate = [NSPredicate predicateWithFormat:@"age>=20 && age<60"];
    NSArray *resultArr = [dbAssistant query:@"Teacher" predicate:tPredicate ascending:NO error:&error];
    NSLog(@"result number:%ld", resultArr.count);
    for (Teacher *t in resultArr) {
        NSLog(@"teacher:%@", t);
    }
    
    return resultArr;
}

- (void)deleteModel {
    
    BFsSQLiteAssistant *dbAssistant = [BFsSQLiteAssistant sharedInstanced];
    NSError *err;
    NSArray *models = [self queryModel];
    for (NSManagedObject *obj in models) {
        [dbAssistant deleteModel:obj error:&err];
        if (err) {
            NSLog(@"delete error: %@", err.description);
            return;
        }
    }
    NSLog(@"delete all data.");
}

@end
