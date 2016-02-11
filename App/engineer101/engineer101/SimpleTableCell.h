//
//  SimpleTableCell.h
//  engineer101
//
//  Created by On Yi Wong on 16/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *knowledgeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *SImageView;
@property (nonatomic, weak) IBOutlet UIImageView *UImageView;
@property (nonatomic, weak) IBOutlet UIImageView *AImageView;
@property (nonatomic, weak) IBOutlet UIImageView *TImageView;
@end
