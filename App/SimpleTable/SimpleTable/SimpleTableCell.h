//
//  UITableViewCell+SimpleTableCell.h
//  SimpleTable
//
//  Created by On Yi Wong on 13/12/2015.
//  Copyright © 2015年 On Yi Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;


@end
