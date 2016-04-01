//
//  ViewController.m
//  YYKiwiTry
//
//  Created by yangyang on 16/3/31.
//  Copyright © 2016年 com.yy. All rights reserved.
//

#import "ViewController.h"
#import "ImageDownloader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *imageTest = [UIImage imageNamed:@"og.jpg"];
    NSLog(@"%@",imageTest);
    
    ImageDownloader *downloader = [[ImageDownloader alloc] init];
    [downloader downloadWithUrl:@"http://images.apple.com/cn/home/images/og.jpg" andDownloaded:^(UIImage *image) {
        NSLog(@"%@",image);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
