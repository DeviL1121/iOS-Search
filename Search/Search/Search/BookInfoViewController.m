//
//  BookInfoViewController.m
//  Search
//
//  Created by 李林 on 16/2/28.
//  Copyright © 2016年 DeviL. All rights reserved.
//

#import "BookInfoViewController.h"

@interface BookInfoViewController ()

@property (weak, nonatomic) IBOutlet UITextView *bookSummary;



@end

@implementation BookInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
    
}

- (void)loadData {
    self.bookSummary.text = [self.bookInfo valueForKey:@"summary"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
