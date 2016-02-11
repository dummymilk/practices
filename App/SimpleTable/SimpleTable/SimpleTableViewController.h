//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by On Yi Wong on 12/12/2015.
//  Copyright © 2015年 On Yi Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableCellView;

@end

