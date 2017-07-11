//
//  XmlParserUtil.h
//  20170710001-SimpleFactory-XMLConfig
//
//  Created by Rainer on 10/07/2017.
//  Copyright © 2017 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlParserUtil : NSObject

/**
 根据配置文件名称和类型解析文件

 @param configName 文件名称
 @param type 类型
 @return 解析完成的字典
 */
- (NSMutableDictionary *)parserWithConfig:(NSString *)configName ofType:(NSString *)type;

@end
