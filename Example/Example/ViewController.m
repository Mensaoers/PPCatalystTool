//
//  ViewController.m
//  Example
//
//  Created by 鹏鹏 on 2022/10/16.
//

#import "ViewController.h"
#import <PPCatalystTool/PPCatalystTool.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

//    NSURL *fileUrl = [[PPCatalystHandle sharedPPCatalystHandle] selectSingleFileWithFolderPath:@""];
//    NSLog(@"我已选择文件路径：%@", fileUrl.absoluteString);
//
//    NSString *folderPath = [[PPCatalystHandle sharedPPCatalystHandle] selectFolderWithPath:@""].absoluteString;
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[PPCatalystHandle sharedPPCatalystHandle] openFileOrDirWithPath:folderPath];
//    });

    [[PPCatalystHandle sharedPPCatalystHandle] openFileOrDirWithPath:@"/Users/garenge/Desktop/arc"];
}


@end
