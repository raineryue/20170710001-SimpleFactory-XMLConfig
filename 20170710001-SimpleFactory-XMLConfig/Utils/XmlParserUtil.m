//
//  XmlParserUtil.m
//  20170710001-SimpleFactory-XMLConfig
//
//  Created by Rainer on 10/07/2017.
//  Copyright © 2017 Rainer. All rights reserved.
//

#import "XmlParserUtil.h"

@interface XmlParserUtil () <NSXMLParserDelegate>

/** 解析结果字典对象 */
@property (nonatomic, strong) NSMutableDictionary *viewBeanDictionary;

@end

@implementation XmlParserUtil

/**
 初始化工具类

 @return 对象
 */
- (instancetype)init {
    if (self = [super init]) {
        // 创建解析结果字典对象
        _viewBeanDictionary = [NSMutableDictionary dictionary];
    }
    
    return self;
}

/**
 根据配置文件名称和类型解析文件
 
 @param configName 文件名称
 @param type 类型
 @return 解析完成的字典
 */
- (NSMutableDictionary *)parserWithConfig:(NSString *)configName ofType:(NSString *)type {
    // 获取文件路径
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:configName ofType:type];
    
    // 获取文件RUL
    NSURL *xmlFileUrl = [[NSURL alloc] initFileURLWithPath:xmlFilePath];
    
    // 根据文件路径创建解析器
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlFileUrl];
    
    // 设置解析器代理
    xmlParser.delegate = self;
    
    // 开始解析文件
    [xmlParser parse];
    
    // 返回解析完成后的字典
    return _viewBeanDictionary;
}

/**
 当开始解析第一个节点的时候的回调方法

 @param parser 解析器
 @param elementName 节点名称
 @param namespaceURI 命名空间
 @param qName log文件名称
 @param attributeDict 节点中的元素
 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"bean"]) {
        NSString *key = [attributeDict objectForKey:@"id"];
        NSString *value = [attributeDict objectForKey:@"class"];
        
        [_viewBeanDictionary setObject:value forKey:key];
    }
}

@end
