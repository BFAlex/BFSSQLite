//
//  BFsSQLiteAssistant.h
//  BFSSQLite
//
//  Created by 刘玲 on 2019/2/19.
//  Copyright © 2019年 BFS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFsSQLiteAssistant : NSObject

+ (instancetype)sharedInstanced;
+ (void)destoryInstanced;

@end

NS_ASSUME_NONNULL_END
