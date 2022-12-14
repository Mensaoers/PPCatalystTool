//
//  ViewController.m
//  Example
//
//  Created by 鹏鹏 on 2022/9/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

#if TARGET_OS_MACCATALYST
//    NSString *filePath = @"/Users";
//
//    NSString *bundleFile = @"PPCatalystPlugin.bundle";
//    NSURL *bundleURL = [[[NSBundle mainBundle] builtInPlugInsURL] URLByAppendingPathComponent:bundleFile];
//    if (!bundleURL) {
//        return;
//    }
//    NSBundle *pluginBundle = [NSBundle bundleWithURL:bundleURL];
//    NSString *className = @"Plugin";
//    Class Plugin= [pluginBundle classNamed:className];
//    //    Plugin *obj = [[Plugin alloc] init];
////    SEL openSel = NSSelectorFromString(@"openFileOrDirWithPath:");
////    if ([Plugin respondsToSelector:openSel]) {
////        [Plugin performSelector:NSSelectorFromString(@"openFileOrDirWithPath:") withObject:filePath];
////    }
//
//    SEL openSel = NSSelectorFromString(@"selectSingleFileWithFolderPath:");
//    if ([Plugin respondsToSelector:openSel]) {
//        NSString *selectedFilePath = [Plugin performSelector:openSel withObject:@"/Users/pengpeng/Desktop/Example"];
//        NSLog(@"我选中了%@", selectedFilePath);
//        NSData *data = [NSData dataWithContentsOfFile:selectedFilePath];
//        NSLog(@"文件大小: %ld", data.length);
//    }

    [self selectSingleFileWithFolderPath:@"/Users/pengpeng/Desktop/Example"];
#endif
}

static NSString *bundleFileName = @"PPCatalystPlugin.bundle";
static NSString *bundlePluginClassName = @"PPCatalystPlugin";

- (Class)getBundleClassWithName:(NSString *)className {
    NSURL *bundleURL = [[[NSBundle mainBundle] builtInPlugInsURL] URLByAppendingPathComponent:bundleFileName];
    if (!bundleURL) {
        return nil;
    }
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    Class bundleClass= [bundle classNamed:className];
    return bundleClass;
}

- (BOOL)openFileOrDirWithPath:(NSString *)path {

#if TARGET_OS_MACCATALYST
    NSString *selectorString = @"openFileOrDirWithPath:";

    Class bundleClass= [self getBundleClassWithName:bundlePluginClassName];

    BOOL result = [self performSelfMethodWithString:selectorString target:bundleClass object:path];

    return result;
#else
    return NO;
#endif
}

- (NSURL *)selectSingleFileWithFolderPath:(NSString *)folderPath {

#if TARGET_OS_MACCATALYST
    NSString *selectorString = @"selectSingleFileWithFolderPath:";

    Class bundleClass= [self getBundleClassWithName:bundlePluginClassName];

    NSURL *selectedFileURL = [self performSelfMethodWithString:selectorString target:bundleClass object:folderPath];
    NSLog(@"我选中了%@", selectedFileURL);
    NSData *data = [NSData dataWithContentsOfURL:selectedFileURL];
    NSLog(@"文件大小: %ld", data.length);

    return selectedFileURL;
#else
    return nil;
#endif
}

/// 执行自定义方法
- (id)performSelfMethodWithString:(NSString *)funcString target:(id)target object:(id)object {
    if (nil == funcString || funcString.length == 0) {
        return nil;
    }

    SEL selector = NSSelectorFromString(funcString);

    if ([target respondsToSelector:selector]) {

        IMP imp = [target methodForSelector:selector];
        id (*func)(id, SEL, id) = (void *)imp;
        return func(target, selector, object);
    } else {
        return nil;
    }
}

/// 执行自定义方法
- (id)performSelfFuncWithString:(NSString *)funcString target:(id)target object:(id)object {
    if (nil == funcString || funcString.length == 0) {
        return nil;
    }
    SEL selector = NSSelectorFromString(funcString);

    if ([target respondsToSelector:selector]) {

        return [target performSelector:selector withObject:object];
    } else {
        return nil;
    }
}


@end
