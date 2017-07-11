//
//  ShengxianCategoryTableViewCell.m
//  20170710001-SimpleFactory-XMLConfig
//
//  Created by Rainer on 10/07/2017.
//  Copyright © 2017 Rainer. All rights reserved.
//

#import "ShengxianCategoryTableViewCell.h"

@implementation ShengxianCategoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor orangeColor];
    }
    
    return self;
}

@end
