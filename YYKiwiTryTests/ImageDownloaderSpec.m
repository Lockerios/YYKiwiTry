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
    context(@"when set by error url", ^{
        __block ImageDownloader *downloaderMock = [KWMock mockForClass:[ImageDownloader class]];
        beforeEach(^{
            [downloaderMock stub:@selector(downloadWithUrl:andDownloaded:) withBlock:^id(NSArray *params) {
                NSString *url = params[0];
                [downloaderMock stub:@selector(url) andReturn:url];
                
                downloadFinishedBlk blk = params[1];
                blk(nil);
                
                return nil;
            }];
        });
        
       it(@"should has url as set", ^{
           [downloaderMock downloadWithUrl:@"Error imageUrl" andDownloaded:^(UIImage *image) {
               [[downloaderMock.url should] equal:@"Error imageUrl"];
           }];
       });
        it(@"should download nothing", ^{
            [downloaderMock downloadWithUrl:@"Error imageUrl" andDownloaded:^(UIImage *image) {
                [[image should] beNil];
            }];
        });
    });
    context(@"when set by correct url", ^{
        __block ImageDownloader *downloaderMock = [KWMock mockForClass:[ImageDownloader class]];
        __block UIImage *testImage = [UIImage imageNamed:@"og.jpg"];
        beforeEach(^{
            [downloaderMock stub:@selector(downloadWithUrl:andDownloaded:) withBlock:^id(NSArray *params) {
                NSString *url = params[0];
                [downloaderMock stub:@selector(url) andReturn:url];
                
                downloadFinishedBlk blk = params[1];
                
                blk(testImage);
                
                return nil;
            }];
        });
        
        it(@"should has url as set", ^{
            [downloaderMock downloadWithUrl:@"Correct imageUrl" andDownloaded:^(UIImage *image) {
                [[downloaderMock.url should] equal:@"Correct imageUrl"];
            }];
        });
        it(@"should download correct image", ^{
            [downloaderMock downloadWithUrl:@"Correct imageUrl" andDownloaded:^(UIImage *image) {
                [[image should] equal:testImage];
            }];
        });
    });
});

SPEC_END