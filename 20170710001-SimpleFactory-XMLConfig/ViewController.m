//
//  ViewController.m
//  20170710001-SimpleFactory-XMLConfig
//
//  Created by Rainer on 10/07/2017.
//  Copyright © 2017 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "CategoryTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)searchCategoryClickedAction:(id)sender {
    CategoryTableViewController *categoryTableViewController = [[CategoryTableViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:categoryTableViewController];
    
    [self presentViewController:navigationController animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
