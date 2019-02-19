//
//  Teacher+CoreDataClass.m
//  BFSSQLite
//
//  Created by 刘玲 on 2019/2/19.
//  Copyright © 2019年 BFS. All rights reserved.
//
//

#import "Teacher+CoreDataClass.h"

@implementation Teacher

- (void)setupDefauleStatus {
    
    self.t_id = @"20190219";
    self.name = @"Mimi";
    self.gender = @"Women";
    self.age = 18;
}

- (NSString *)description {
    
    NSString *desc = [NSString stringWithFormat:@"[model ---> id:%@, name:%@, gender:%@, age:%d]", self.t_id, self.name, self.gender, self.age];
    return desc;
}

@end
