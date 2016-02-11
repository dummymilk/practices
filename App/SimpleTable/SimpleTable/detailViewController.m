//
//  detailViewController.m
//  SimpleTable
//
//  Created by On Yi Wong on 21/12/2015.
//  Copyright © 2015年 On Yi Wong. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController

@synthesize nameLabel;
@synthesize name;
@synthesize imageLabel;
@synthesize imageName;
@synthesize teamLabel;
@synthesize teamName;

- (void)viewDidLoad {
    [super viewDidLoad];
    nameLabel.text = name;
    teamLabel.text = teamName;
    imageLabel.image = [UIImage imageNamed:imageName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
