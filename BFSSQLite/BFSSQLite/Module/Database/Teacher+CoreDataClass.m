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
    
    self.t_id = @"20190220";
    self.gender = @"Women";
    self.age = arc4random() % 80 + 18;
    self.name = [NSString stringWithFormat:@"%@%02d", self.t_id, self.age];
}

- (NSString *)description {
    
    NSString *desc = [NSString stringWithFormat:@"[model ---> id:%@, name:%@, gender:%@, age:%d]", self.t_id, self.name, self.gender, self.age];
    return desc;
}

@end
