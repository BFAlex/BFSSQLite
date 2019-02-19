//
//  BFsSQLiteAssistant.m
//  BFSSQLite
//
//  Created by 刘玲 on 2019/2/19.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import "BFsSQLiteAssistant.h"

@interface BFsSQLiteAssistant () {
    BFsSQLiteModel *_model;
    NSManagedObjectContext *_managedObjectContext;
}
//@property (nonatomic, strong) BFsSQLiteModel *model;

@end

@implementation BFsSQLiteAssistant

static BFsSQLiteAssistant *assistant;
static dispatch_once_t  onceToken;


#pragma mark - Common

- (void)initDefault {
    
    self.model.flag = arc4random() % 10;
    
    //database
    [self openDB];  
}

- (void)test {
    
}

#pragma mark - Database

- (void)openDB {
    // Coredata Model
    NSURL *t_modelUrl = [[NSBundle mainBundle] URLForResource:@"BFsSchool" withExtension:@"momd"];
    NSManagedObjectModel *teacherModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:t_modelUrl];
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:teacherModel];
    // 本地数据库路径
    NSURL *dbUrl = [NSURL fileURLWithPath:[NSHomeDirectory() stringByAppendingString:@"/Documents/school_db.sqlite"]];
    NSError *error;
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:dbUrl options:nil error:&error];
    if (!error) {
        NSLog(@"打开数据库成功");
    } else {
        NSLog(@"打开数据库失败: %@", error.description);
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _managedObjectContext.persistentStoreCoordinator = store;
}

- (id)createModel:(NSString *)entityName {
    NSManagedObject *manageObject = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self->_managedObjectContext];
    return manageObject;
}

- (void)saveModel:(NSManagedObject *)model {
    [_managedObjectContext insertObject:model];
    NSError *error;
    if ([_managedObjectContext save:&error]) {
        NSLog(@"保存成功");
    } else {
        NSLog(@"保存失败:%@", error.description);
    }
}

- (NSArray *)query:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError * _Nullable __autoreleasing * _Nullable)error {
    if (entityName.length < 1) {
        return nil;
    }
    //
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    request.predicate = predicate;
    
    return [_managedObjectContext executeFetchRequest:request error:error];
}

#pragma mark - Property

- (BFsSQLiteModel *)model {
    
    if (!_model) {
        _model = [BFsSQLiteModel model];
    }
    
    return _model;
}

#pragma mark - Private

- (instancetype)init {
    if (self = [super init]) {
        [self initDefault];
    }
    
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"[%@]--->%d", NSStringFromClass([self class]), self.model.flag];
}

#pragma mark - API

+ (instancetype)sharedInstanced {
    
    dispatch_once(&onceToken, ^{
        assistant = [[BFsSQLiteAssistant alloc] init];
    });
    
    return assistant;
}

+ (void)destoryInstanced {
    NSLog(@"【%@】%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    if (onceToken || assistant) {
        onceToken = 0;
        assistant = nil;
    }
}

@end
