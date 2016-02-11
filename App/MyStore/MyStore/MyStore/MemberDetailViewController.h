//
//  DeviceDetailViewController.h
//  MyStore
//
//  Created by On Yi Wong on 6/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberDetailViewController : UIViewController

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UITextField *teamTextField;

@end

