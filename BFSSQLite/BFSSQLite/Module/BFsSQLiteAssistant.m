//
//  BFsSQLiteAssistant.m
//  BFSSQLite
//
//  Created by 刘玲 on 2019/2/19.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import "BFsSQLiteAssistant.h"

@implementation BFsSQLiteAssistant

static BFsSQLiteAssistant *assistant;
static dispatch_once_t  onceToken;

+ (instancetype)sharedInstanced {
    
    dispatch_once(&onceToken, ^{
        assistant = [[BFsSQLiteAssistant alloc] init];
    });
    
    return assistant;
}

+ (void)destoryInstanced {
    
    if (onceToken || assistant) {
        onceToken = 0;
        assistant = nil;
    }
}

@end
