//
//  ViewsFactory.h
//  20170710001-SimpleFactory-XMLConfig
//
//  Created by Rainer on 10/07/2017.
//  Copyright © 2017 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewsFactory : NSObject

/**
 创建一个单例对象

 @return 对象
 */
+ (instancetype)sharedInstance;

/**
 根据模版名称创建一个分类表格行对象

 @param templateId 模版ID
 @return 分类表格行对象
 */
- (NSObject *)createCategoryTableViewCellWithTemplateId:(NSString *)templateId;

@end
