//
//  ImageDownloader.m
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader

- (void)downloadWithUrl:(NSString *)url andDownloaded:(downloadFinishedBlk)blk {
    _url = url;
}

- (void)cancel {
    
}

@end
