//
//  SimpleTableCell.m
//  engineer101
//
//  Created by On Yi Wong on 16/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell

@synthesize knowledgeLabel;
@synthesize SImageView;
@synthesize UImageView;
@synthesize AImageView;
@synthesize TImageView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
