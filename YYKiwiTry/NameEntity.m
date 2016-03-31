//
//  NameEntity.m
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import "NameEntity.h"

@implementation NameEntity

+ (NameEntity *)sharedInstance {
    static NameEntity *entity = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        entity = [[NameEntity alloc] init];
    });
    
    return entity;
}

- (BOOL)hasName {
    return self.name!=nil;
}

- (NSString *)getName {
    return self.name? self.name:@"";
}

- (void)reset {
    self.name = nil;
}

@end
