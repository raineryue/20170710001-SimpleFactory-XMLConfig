//
//  CategoryTableViewController.m
//  20170710001-SimpleFactory-XMLConfig
//
//  Created by Rainer on 10/07/2017.
//  Copyright © 2017 Rainer. All rights reserved.
//

#import "CategoryTableViewController.h"
#import "ViewsFactory.h"

@interface CategoryTableViewController ()

@property (nonatomic, strong) NSArray *dataListArray;

@end

@implementation CategoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeBarButtonItemClickedAction:)];
    
    self.tableView.rowHeight = 60;
}

- (void)closeBarButtonItemClickedAction:(UIBarButtonItem *)barButtonItem {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *categoryDictionary = self.dataListArray[indexPath.row];

    NSString *tableViewCellIdentifier = [categoryDictionary objectForKey:@"templateId"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
    if (nil == cell) {
        cell = (UITableViewCell *)[[ViewsFactory sharedInstance] createCategoryTableViewCellWithTemplateId:[categoryDictionary objectForKey:@"templateId"]];
    }
    
    cell.textLabel.text = [categoryDictionary objectForKey:@"templateName"];
    
    return cell;
}

- (NSArray *)dataListArray {
    if (nil == _dataListArray) {
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"CategoryList" ofType:@"plist"];
        
        _dataListArray = [NSArray arrayWithContentsOfFile:dataFilePath];
    }
    
    return _dataListArray;
}

@end
