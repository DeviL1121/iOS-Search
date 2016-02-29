//
//  ResultTableViewController.m
//  Search
//
//  Created by 李林 on 16/2/28.
//  Copyright © 2016年 DeviL. All rights reserved.
//

#import "ResultTableViewController.h"
#import "BookInfoViewController.h"


@interface ResultTableViewController ()

@property (copy, nonatomic) NSDictionary *resDict;
@property (copy, nonatomic) NSArray *books;
@property (copy, nonatomic) NSArray *bookNames;

@end

@implementation ResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self startSearch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 
 网络请求，可修改为单例模式，异步请求
 
 */

- (void)startSearch {
    NSString *strURL = [[NSString alloc] initWithFormat:@"https://api.douban.com/v2/book/search?q=%@",self.searchKey];
    strURL = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:nil
                                                     error:nil];
    self.resDict = [NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingAllowFragments
                                                     error:nil];
    self.books = [self.resDict objectForKey:@"books"];
    self.bookNames = [self.books valueForKey:@"title"];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [self.books count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"CellForBook";
    NSString *bookName = self.bookNames[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = bookName;
    
    
    return cell;

    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    BookInfoViewController *bookInfoVC = segue.destinationViewController;
    NSDictionary *bookInfo = self.books[indexPath.row];
    NSString *bookName = self.bookNames[indexPath.row];
    bookInfoVC.navigationItem.title = bookName;
    bookInfoVC.bookInfo = bookInfo;
    
}






@end
