//
//  detailViewController.h
//  SimpleTable
//
//  Created by On Yi Wong on 21/12/2015.
//  Copyright © 2015年 On Yi Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) NSString *name;
@property (weak, nonatomic) IBOutlet UIImageView *imageLabel;
@property (nonatomic, strong) NSString *imageName;
@property (weak, nonatomic) IBOutlet UILabel *teamLabel;
@property (nonatomic, strong) NSString *teamName;

@end
