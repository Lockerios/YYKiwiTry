//
//  ImageDownloader.m
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import "ImageDownloader.h"
#import <AFNetworking.h>
#import <AFImageDownloader.h>

@implementation ImageDownloader

- (void)downloadWithUrl:(NSString *)url andDownloaded:(downloadFinishedBlk)blk {
    self.url = url;
    
    __block ImageDownloader *blkSelf = self;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [[AFImageDownloader defaultInstance] downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        blkSelf.image = responseObject;
        
        blk(responseObject);
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        blkSelf.image = nil;
        
        blk(nil);
    }];
}

@end
