//
//  SearchViewController.m
//  Search
//
//  Created by 李林 on 16/2/28.
//  Copyright © 2016年 DeviL. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultTableViewController.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (IBAction)search:(UIButton *)sender {
    
    
}

//点击背景关闭键盘
- (IBAction)backgroundTap:(id)sender {
    [self.searchTextField resignFirstResponder];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ResultTableViewController *resVC = segue.destinationViewController;
    resVC.navigationItem.title = @"搜索结果";
    resVC.searchKey = self.searchTextField.text;
}




@end
