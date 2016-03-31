//
//  ImageDownloader.h
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageDownloader;

typedef ImageDownloader*(^downloadFinishedBlk)();

@interface ImageDownloader : NSObject

@property (nonatomic, strong, readonly) NSString *url;
@property (nonatomic, strong, readonly) UIImage *image;

- (void)downloadWithUrl:(NSString *)url andDownloaded:(downloadFinishedBlk)blk;
- (void)cancel;

@end
