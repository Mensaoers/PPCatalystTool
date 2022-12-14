//
//  PPCatalystHandle.h
//  PPCatalystTool
//
//  Created by 鹏鹏 on 2022/10/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPCatalystHandle : NSObject

+ (PPCatalystHandle *)sharedPPCatalystHandle;

- (BOOL)openFileOrDirWithPath:(nonnull NSString *)path;
- (nullable NSURL *)selectSingleFileWithFolderPath:(nonnull NSString *)folderPath;

@end

NS_ASSUME_NONNULL_END
