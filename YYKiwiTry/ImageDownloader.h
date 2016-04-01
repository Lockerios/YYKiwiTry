//
//  ImageDownloader.h
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageDownloader;

typedef void(^downloadFinishedBlk)(UIImage *image);

@interface ImageDownloader : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) UIImage *image;

- (void)downloadWithUrl:(NSString *)url andDownloaded:(downloadFinishedBlk)blk;

@end
