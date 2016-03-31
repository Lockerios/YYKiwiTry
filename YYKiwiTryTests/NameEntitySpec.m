//
//  NameEntitySpec.m
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import <Kiwi.h>
#import "NameEntity.h"

SPEC_BEGIN(NameEntitySpec)

describe(@"NameEntity", ^{
    context(@"Before created", ^{
        it(@"Should has a singleton", ^{
            [[[NameEntity sharedInstance] shouldNot] beNil];
        });
    });
   context(@"When created", ^{
       NameEntity *entity = [NameEntity sharedInstance];
       afterEach(^{
           [entity reset];
       });
       it(@"Should not be nil", ^{
           [[entity shouldNot] beNil];
       });
       it(@"name should be nil", ^{
           [[entity.name should] beNil];
       });
       it(@"hasName should return NO", ^{
           [[theValue([entity hasName]) should] equal:theValue(NO)];
       });
       it(@"getName should return @\"\"", ^{
           [[[entity getName] should] equal:@""];
       });
   });
    context(@"After set name as @\"Jak\"", ^{
        NameEntity *entity = [NameEntity sharedInstance];
        beforeEach(^{
            entity.name = @"Jak";
        });
        afterEach(^{
            [entity reset];
        });
        it(@"should has name as @\"Jak\"", ^{
            [[entity.name should] equal:@"Jak"];
        });
        it(@"hasName should return YES", ^{
            [[theValue([entity hasName]) should] equal:theValue(YES)];
        });
        it(@"getName should return @\"Jak\"", ^{
            [[[entity getName] should] equal:@"Jak"];
        });
    });
    context(@"After reset", ^{
        NameEntity *entity = [NameEntity sharedInstance];
        beforeEach(^{
            entity.name = @"Jak";
            [entity reset];
        });
        it(@"Should not be nil", ^{
            [[entity shouldNot] beNil];
        });
        it(@"name should be nil", ^{
            [[entity.name should] beNil];
        });
        it(@"hasName should return NO", ^{
            [[theValue([entity hasName]) should] equal:theValue(NO)];
        });
        it(@"getName should return @\"\"", ^{
            [[entity.getName should] equal:@""];
        });
    });
});

SPEC_END