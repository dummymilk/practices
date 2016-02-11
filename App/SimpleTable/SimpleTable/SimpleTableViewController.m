//
//  ViewController.m
//  SimpleTable
//
//  Created by On Yi Wong on 12/12/2015.
//  Copyright © 2015年 On Yi Wong. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableCell.h"
#import "detailViewController.h"
#import "TeamInfo.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController{
    NSArray *TeamInfos;
    NSMutableArray *teammateArray;
    NSMutableArray *iconOfTeammateArray;
    NSMutableArray *teamArray;
    NSArray *teammateSearchResults;
    NSArray *iconOfTeammateSearchResults;
}
@synthesize tableCellView;

- (void)viewDidLoad {
    [super viewDidLoad];
    TeamInfo *teammate1 = [TeamInfo new];
    teammate1.name = @"Milk";
    teammate1.team = @"ChuBao";
    teammate1.imageFile = @"milk.jpg";
    
    TeamInfo *teammate2 = [TeamInfo new];
    teammate2.name = @"Keith";
    teammate2.team = @"ChuBao";
    teammate2.imageFile = @"keith.jpg";
    
    TeamInfo *teammate3 = [TeamInfo new];
    teammate3.name = @"David";
    teammate3.team = @"ChuBao";
    teammate3.imageFile = @"david.jpg";
    
    TeamInfo *teammate4 = [TeamInfo new];
    teammate4.name = @"Sam";
    teammate4.team = @"ChuBao";
    teammate4.imageFile = @"sam.jpg";
    
    TeamInfos = [NSArray arrayWithObjects:teammate1, teammate2, teammate3, teammate4, nil];

//    teammateArray = [NSMutableArray arrayWithObjects:@"Milk", @"Keith", @"David", @"Sam", nil];
//    iconOfTeammateArray =[NSMutableArray arrayWithObjects:@"milk.jpg",@"keith.jpg",@"david.jpg",@"sam.jpg",nil];
//    teamArray = [NSMutableArray arrayWithObjects:@"ChuBao", @"ChuBao", @"ChuBao", @"ChuBao", nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [teammateSearchResults count];
        
    } else {
        return [TeamInfos count];
        
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"NameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        TeamInfo *teammate = [teammateSearchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = teammate.name;
    } else {
        TeamInfo *teammate = [TeamInfos objectAtIndex:indexPath.row];
        cell.textLabel.text = teammate.name;
    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    // remove the row from Data model
//    [TeamInfos delete:indexPath.row];
//    [teamArray removeObjectAtIndex:indexPath.row];
//    [teammateArray removeObjectAtIndex:indexPath.row];
//    [iconOfTeammateArray removeObjectAtIndex:indexPath.row];
    // reload table view
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        detailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            TeamInfo *teammate = [TeamInfos objectAtIndex:indexPath.row];
            destViewController.name = teammate.name;
            destViewController.imageName = teammate.imageFile;
            destViewController.teamName = teammate.team;
        } else {
            indexPath = [self.tableCellView indexPathForSelectedRow];
            TeamInfo *teammate = [TeamInfos objectAtIndex:indexPath.row];
            destViewController.name = teammate.name;
            destViewController.imageName = teammate.imageFile;
            destViewController.teamName = teammate.team;
        }
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier: @"showDetail" sender: self];
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    teammateSearchResults = [teammateArray filteredArrayUsingPredicate:resultPredicate];
    iconOfTeammateSearchResults = [iconOfTeammateArray filteredArrayUsingPredicate:resultPredicate];
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    return YES;
}

@end
