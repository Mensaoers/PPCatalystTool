//
//  PPCatalystPlugin.h
//  PPCatalystPlugin
//
//  Created by 鹏鹏 on 2021/3/11.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPCatalystPlugin : NSObject

- (BOOL)openFileOrDirWithPath:(NSString *)path;
+ (BOOL)openFileOrDirWithPath:(NSString *)path;
+ (NSURL *)selectSingleFileWithFolderPath:(NSString *)folderPath;

@end

NS_ASSUME_NONNULL_END
