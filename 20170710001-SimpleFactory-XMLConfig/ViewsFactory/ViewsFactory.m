//
//  ViewsFactory.m
//  20170710001-SimpleFactory-XMLConfig
//
//  Created by Rainer on 10/07/2017.
//  Copyright © 2017 Rainer. All rights reserved.
//

#import "ViewsFactory.h"
#import "XmlParserUtil.h"
#import <UIKit/UIKit.h>

@interface ViewsFactory ()

/** 解析结果字典对象 */
@property (nonatomic, strong) NSMutableDictionary *viewBeanDictionary;

@end

@implementation ViewsFactory

/** 单例对象 */
static id _instance;

/**
 创建一个单例对象
 
 @return 对象
 */
+ (instancetype)sharedInstance {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (id)copyWithZone:(struct _NSZone *)zone {
    return _instance;
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return _instance;
}

/**
 初始化对象

 @return 对象
 */
- (instancetype)init {
    self = [super init];
    if (self) {
        // 创建文件解析工具类
        XmlParserUtil *xmlParserUtil = [[XmlParserUtil alloc] init];
        
        // 解析指定配置文件
        _viewBeanDictionary = [xmlParserUtil parserWithConfig:@"ViewBeanConfig" ofType:@"xml"];
    }
    return self;
}

/**
 根据模版名称创建一个分类表格行对象
 
 @param templateId 模版ID
 @return 分类表格行对象
 */
- (NSObject *)createCategoryTableViewCellWithTemplateId:(NSString *)templateId {
    return [[NSClassFromString([_viewBeanDictionary objectForKey:templateId]) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:templateId];
}

@end
