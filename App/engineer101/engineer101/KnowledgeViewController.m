//
//  KnowledgeViewController.m
//  engineer101
//
//  Created by On Yi Wong on 16/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import "KnowledgeViewController.h"

@interface KnowledgeViewController ()

@end

@implementation KnowledgeViewController{
    NSString *SImage;
    NSString *UImage;
    NSString *AImage;
    NSString *TImage;
    NSString *SImageStatus;
    NSString *UImageStatus;
    NSString *AImageStatus;
    NSString *TImageStatus;
//    BOOL *SImageStatus;
//    BOOL *UImageStatus;
//    BOOL *AImageStatus;
//    BOOL *TImageStatus;
}

@synthesize knowledge_title;
@synthesize knowledgeTitle;
@synthesize knowledgeId;
@synthesize SImageButton;
@synthesize UImageButton;
@synthesize AImageButton;
@synthesize TImageButton;

- (void)get_data:(NSMutableURLRequest *)request {
    
    [request setHTTPMethod: @"GET"];
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    
    id json = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    NSArray *jsonArray = (NSArray *)json;
    for(NSInteger i=0;i<jsonArray.count;i++){
        if([[jsonArray[i] objectForKey:@"knowledge_title"] isEqualToString:knowledgeTitle]){
            
            if ([[jsonArray[i] objectForKey:@"is_someone_taught_you"]boolValue] == NO){
                SImage = @"S_grey.png";
            }else{
                SImage = @"S.png";
            }
            
            if ([[jsonArray[i] objectForKey:@"is_understood"]boolValue] == NO){
                UImage = @"U_grey.png";
            }else{
                UImage = @"U.png";
            }
            
            if ([[jsonArray[i] objectForKey:@"is_applied"]boolValue] == NO){
                AImage = @"A_grey.png";
            }else{
                AImage = @"A.png";
            }
            
            if ([[jsonArray[i] objectForKey:@"is_taught_others"]boolValue] == NO){
                TImage = @"T_grey.png";
            }else{
                TImage = @"T.png";
            }
        }
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://engineer101.hkdev.motherapp.com/api/user_knowledge/list?is_complete=All"]];
    [self get_data:request];
    
    knowledge_title.text = knowledgeTitle;
    [SImageButton setImage:[UIImage imageNamed:SImage] forState:UIControlStateNormal];
    [UImageButton setImage:[UIImage imageNamed:UImage] forState:UIControlStateNormal];
    [AImageButton setImage:[UIImage imageNamed:AImage] forState:UIControlStateNormal];
    [TImageButton setImage:[UIImage imageNamed:TImage] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleButtonImage:(NSString *)word sender:(id)sender nWord:(NSString *)nWord {
    if( [[sender imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:word]])
    {
        [sender setImage:[UIImage imageNamed:nWord] forState:UIControlStateNormal];
    }
    else
    {
        [sender setImage:[UIImage imageNamed:word] forState:UIControlStateNormal];
    }
}

- (IBAction)SImageAction:(id)sender {
    [self toggleButtonImage:@"S.png" sender:sender nWord:@"S_grey.png"];
}

- (IBAction)UImageAction:(id)sender {
    [self toggleButtonImage:@"U.png" sender:sender nWord:@"U_grey.png"];
}

- (IBAction)AImageAction:(id)sender {
    [self toggleButtonImage:@"A.png" sender:sender nWord:@"A_grey.png"];
}

- (IBAction)TImageAction:(id)sender {
    [self toggleButtonImage:@"T.png" sender:sender nWord:@"T_grey.png"];
}

- (void)updatedStatus {
    if( [[SImageButton imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"S.png"]]){
        SImageStatus = @"1";
    }else{
        SImageStatus = @"0";
    }
    if( [[UImageButton imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"U.png"]]){
        UImageStatus = @"1";
    }else{
        UImageStatus = @"0";
    }
    if( [[AImageButton imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"A.png"]]){
        AImageStatus = @"1";
    }else{
        AImageStatus = @"0";
    }
    if( [[TImageButton imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"T.png"]]){
        TImageStatus = @"1";
    }else{
        TImageStatus = @"0";
    }
}

- (IBAction)submitAction:(id)sender {
    
    [self updatedStatus];
//    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
//                         @"793", @"user_knowledge_id",
//                         SImageStatus, @"is_someone_taught_you",
//                         UImageStatus, @"is_understood",
//                         AImageStatus, @"is_applied",
//                         TImageStatus, @"is_taught_others",
//                         nil];

    
    NSString *myRequestString =[NSString stringWithFormat:@"user_knowledge_id=%@&is_someone_taught_you=%u&is_understood=%u&is_applied=%u&is_taught_others=%u",knowledgeId,true,false,YES,NO];
//    NSString *myRequestString =[NSString stringWithFormat:@"user_knowledge_id=%@&is_someone_taught_you=%@&is_understood=%@&is_applied=%@&is_taught_others=%@",knowledgeId,SImageStatus,UImageStatus,AImageStatus,TImageStatus];
    
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://engineer101.hkdev.motherapp.com/api/user_knowledge/update"]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    
    id json = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
}

@end
