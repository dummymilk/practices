//
//  KnowledgeViewController.h
//  engineer101
//
//  Created by On Yi Wong on 16/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KnowledgeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *knowledge_title;
@property (strong, nonatomic) NSString *knowledgeTitle;
@property (strong, nonatomic) NSString *knowledgeId;
@property (weak, nonatomic) IBOutlet UIButton *SImageButton;
@property (weak, nonatomic) IBOutlet UIButton *UImageButton;
@property (weak, nonatomic) IBOutlet UIButton *AImageButton;
@property (weak, nonatomic) IBOutlet UIButton *TImageButton;
@property (weak, nonatomic) IBOutlet UIButton *submit;


@end
