//
//  KnowledgeViewController.h
//  engineer101
//
//  Created by On Yi Wong on 16/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnowledgeTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *showAll;
@property (weak, nonatomic) IBOutlet UIButton *showComplete;
@property (weak, nonatomic) IBOutlet UIButton *showIncomplete;

@property (weak, nonatomic) IBOutlet UITableView *knowledgetableView;

@end
