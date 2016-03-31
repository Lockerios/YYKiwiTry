//
//  NameEntity.h
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NameEntity : NSObject

@property (nonatomic, strong) NSString *name;

+ (NameEntity *)sharedInstance;

- (BOOL)hasName;

- (NSString *)getName;

- (void)reset;

@end
