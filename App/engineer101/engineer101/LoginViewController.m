//
//  ViewController.m
//  engineer101
//
//  Created by On Yi Wong on 16/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import "LoginViewController.h"
#import "KnowledgeTableViewController.h"

@interface LoginViewController (){
    NSMutableData *receivedData_;
}

@end

@implementation LoginViewController

@synthesize userId;
@synthesize password;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [userId resignFirstResponder];
    [password resignFirstResponder];
}

- (IBAction)login:(id)sender {
    NSString *myRequestString =[NSString stringWithFormat:@"email=%@&password=%@",self.userId.text, self.password.text];
    NSData *myRequestData = [NSData dataWithBytes: [myRequestString UTF8String] length: [myRequestString length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString: @"http://engineer101.hkdev.motherapp.com/api/user/login/"]];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: myRequestData];
    NSData *returnData = [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];

    id json = [NSJSONSerialization JSONObjectWithData:returnData options:0 error:nil];
    
    if([[json objectForKey:@"status"] isEqualToString:@"success"]){
        [self performSegueWithIdentifier:@"sucessfulLogin" sender:self];
        
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Username or Password Incorrect"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

- (IBAction)autofill:(id)sender {
    [userId setText:@"milk@motherapp.com"];
    [password setText: @"123"];
}

@end
