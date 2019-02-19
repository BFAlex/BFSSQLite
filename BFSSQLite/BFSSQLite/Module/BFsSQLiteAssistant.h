//
//  BFsSQLiteAssistant.h
//  BFSSQLite
//
//  Created by 刘玲 on 2019/2/19.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFsSQLiteModel.h"
#import <sqlite3.h>
#import <CoreData/CoreData.h>
#import "Teacher+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface BFsSQLiteAssistant : NSObject

@property (nonatomic, strong, readonly) BFsSQLiteModel *model;

+ (instancetype)sharedInstanced;
+ (void)destoryInstanced;

- (id)createModel:(NSString *)entityName;
- (void)saveModel:(NSManagedObject *)model;
- (NSArray *)query:(NSString *)entityName predicate:(NSPredicate *)predicate error:(NSError * _Nullable __autoreleasing * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
