//
//  MasterTableViewController.m
//  PassDataWithDelegate
//
//  Created by Vu Ngoc Cong on 6/27/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import "MasterTableViewController.h"
#import "DetailViewController.h"

@interface MasterTableViewController () <DetailViewControllerDelegate>
@property NSMutableArray *nameStudents;
@end

@implementation MasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.nameStudents) {
        self.nameStudents = [[NSMutableArray alloc]init];
        [self.nameStudents insertObject:@"Công" atIndex:0];
        [self.nameStudents insertObject:@"Thiện" atIndex:1];
        [self.nameStudents insertObject:@"Dũng" atIndex:2];
        [self.nameStudents insertObject:@"Minh" atIndex:3];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.nameStudents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.nameStudents[indexPath.row];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController *vc;
    NSIndexPath *indexPath;
    if ((vc = [segue destinationViewController])) {
        if ((indexPath = [self.tableView indexPathForSelectedRow])) {
            vc.name = self.nameStudents[indexPath.row];
            vc.delegate = self;
        }
    }
}

-(void)passData:(NSString *)text{
    NSIndexPath *indexPath;
    
    if ((indexPath = [self.tableView indexPathForSelectedRow])) {
        self.nameStudents[indexPath.row] = text;
        
    }
    [self.tableView reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
