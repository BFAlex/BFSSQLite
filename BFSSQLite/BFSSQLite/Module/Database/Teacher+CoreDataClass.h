//
//  Teacher+CoreDataClass.h
//  BFSSQLite
//
//  Created by 刘玲 on 2019/2/19.
//  Copyright © 2019年 BFS. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Teacher : NSManagedObject

- (void)setupDefauleStatus;

@end

NS_ASSUME_NONNULL_END

#import "Teacher+CoreDataProperties.h"
