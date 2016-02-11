//
//  KnowledgeTableViewController.m
//  engineer101
//
//  Created by On Yi Wong on 16/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import "KnowledgeTableViewController.h"
#import "KnowledgeViewController.h"
#import "SimpleTableCell.h"

@interface KnowledgeTableViewController ()

@end

@implementation KnowledgeTableViewController{
    NSMutableArray *tableData;
    NSMutableArray *knowledgeIdArray;
    NSMutableArray *SImageArray;
    NSMutableArray *UImageArray;
    NSMutableArray *AImageArray;
    NSMutableArray *TImageArray;
}
@synthesize knowledgetableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize table data
    tableData = [NSMutableArray arrayWithObjects: nil];
    SImageArray = [NSMutableArray arrayWithObjects:@"S.png", @"S.png", @"S.png", @"S.png", nil];
    UImageArray = [NSMutableArray arrayWithObjects:@"U.png", @"U.png", @"U.png", @"U.png", nil];
    AImageArray = [NSMutableArray arrayWithObjects:@"A.png", @"A.png", @"A.png", @"A.png", nil];
    TImageArray = [NSMutableArray arrayWithObjects:@"T.png", @"T.png", @"T.png", @"T.png", nil];
    knowledgeIdArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", nil];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://engineer101.hkdev.motherapp.com/api/user_knowledge/list?is_complete=All"]];
    [self get_data:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.knowledgeLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.SImageView.image = [UIImage imageNamed:[SImageArray objectAtIndex:indexPath.row]];
    cell.UImageView.image = [UIImage imageNamed:[UImageArray objectAtIndex:indexPath.row]];
    cell.AImageView.image = [UIImage imageNamed:[AImageArray objectAtIndex:indexPath.row]];
    cell.TImageView.image = [UIImage imageNamed:[TImageArray objectAtIndex:indexPath.row]];

    
    return cell;
}

- (void)get_data:(NSMutableURLRequest *)request {
    [tableData removeAllObjects];
    [knowledgeIdArray removeAllObjects];
    [SImageArray removeAllObjects];
    [UImageArray removeAllObjects];
    [AImageArray removeAllObjects];
    [TImageArray removeAllObjects];
    [request setHTTPMethod: @"GET"];
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    
    id json = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    NSArray *jsonArray = (NSArray *)json;
    for(NSInteger i=0;i<jsonArray.count;i++){
        
        NSString *knowledge_title = [jsonArray[i] objectForKey:@"knowledge_title"];
        NSString *knowledge_id = [[jsonArray[i] objectForKey:@"id"] stringValue];
        
        [tableData setObject:knowledge_title atIndexedSubscript:i];
        [knowledgeIdArray setObject:knowledge_id atIndexedSubscript:i];
        
        
        
        if ([[jsonArray[i] objectForKey:@"is_someone_taught_you"]boolValue] == NO){
            [SImageArray setObject:@"S_grey.png" atIndexedSubscript:i];
        }else{
            [SImageArray setObject:@"S.png" atIndexedSubscript:i];
        }
        
        if ([[jsonArray[i] objectForKey:@"is_understood"]boolValue] == NO){
            [UImageArray setObject:@"U_grey.png" atIndexedSubscript:i];
        }else{
            [UImageArray setObject:@"U.png" atIndexedSubscript:i];
        }
        
        if ([[jsonArray[i] objectForKey:@"is_applied"]boolValue] == NO){
            [AImageArray setObject:@"A_grey.png" atIndexedSubscript:i];
        }else{
            [AImageArray setObject:@"A.png" atIndexedSubscript:i];
        }
        
        if ([[jsonArray[i] objectForKey:@"is_taught_others"]boolValue] == NO){
            [TImageArray setObject:@"T_grey.png" atIndexedSubscript:i];
        }else{
            [TImageArray setObject:@"T.png" atIndexedSubscript:i];
        }
        
    }
    
    [self.knowledgetableView reloadData];
}

- (IBAction)showAll:(id)sender {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://engineer101.hkdev.motherapp.com/api/user_knowledge/list?is_complete=All"]];
    [self get_data:request];
}

- (IBAction)showComplete:(id)sender {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://engineer101.hkdev.motherapp.com/api/user_knowledge/list?is_complete=True"]];
    [self get_data:request];
}


- (IBAction)showIncomplete:(id)sender {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://engineer101.hkdev.motherapp.com/api/user_knowledge/list?is_complete=False"]];
    [self get_data:request];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.knowledgetableView indexPathForSelectedRow];
        KnowledgeViewController *destViewController = segue.destinationViewController;
        destViewController.knowledgeTitle = [tableData objectAtIndex:indexPath.row];
        destViewController.knowledgeId = [knowledgeIdArray objectAtIndex:indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier: @"showDetail" sender: self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
