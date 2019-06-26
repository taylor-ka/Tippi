//
//  ViewController.m
//  Tippi
//
//  Created by taylorka on 6/25/19.
//  Copyright © 2019 taylorka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:0.22 forKey:@"custom_tip"];
    [defaults synchronize];
}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    [self updateCalculation];
}

- (void)updateCalculation {
    double bill = [self.billField.text doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double custom = [defaults doubleForKey:@"custom_tip"];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(custom)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y +30 ,self.billField.frame.size.width, self.billField.frame.size.height);
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 0;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        CGRect newFrame = self.billField.frame;
        newFrame.origin.y -= 30;
        
        self.billField.frame = newFrame;
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double custom = [defaults doubleForKey:@"custom_tip"] * 100;
    int rounded = custom;
    
    [self.tipControl setTitle: [NSString stringWithFormat:@"%i%%", rounded] forSegmentAtIndex:2];
    
    [self updateCalculation];
    
    NSLog(@"View will appear");
}


@end
