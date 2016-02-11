//
//  MemberViewController.m
//  MyStore
//
//  Created by On Yi Wong on 6/1/2016.
//  Copyright © 2016年 On Yi Wong. All rights reserved.
//

#import "MemberDetailViewController.h"
#import <CoreData/CoreData.h>

@interface MemberDetailViewController ()

@end

@implementation MemberDetailViewController

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newMember = [NSEntityDescription insertNewObjectForEntityForName:@"Member" inManagedObjectContext:context];
    
    [newMember setValue:self.nameTextField.text forKey:@"name"];
    [newMember setValue:self.birthdayTextField.text forKey:@"birthday"];
    [newMember setValue:self.teamTextField.text forKey:@"team"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
