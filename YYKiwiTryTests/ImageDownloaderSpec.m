//
//  ImageDownloaderSpec.m
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import <Kiwi.h>
#import "ImageDownloader.h"

SPEC_BEGIN(ImageDownloaderSpec)

describe(@"ImageDownloader", ^{
   context(@"when created", ^{
       ImageDownloader *downloader = [[ImageDownloader alloc] init];
      it(@"should not be nil", ^{
          [[downloader shouldNot] beNil];
      });
       it(@"url should be nil", ^{
           [[downloader.url should] beNil];
       });
       it(@"image should be nil", ^{
           [[downloader.image should] beNil];
       });
   });
    context(@"when set by downloadWithUrl_", ^{
        __block ImageDownloader *downloader = [[ImageDownloader alloc] init];
        [downloader downloadWithUrl:@"imageUrl" andDownloaded:^ImageDownloader *{
            return downloader;
        }];
       it(@"should has url as set", ^{
           [[downloader.url should] equal:@"imageUrl"];
       });
        pending(@"should call blk as set when download finished", ^{
            
        });
    });
});

SPEC_END