//
//  SettingsViewController.m
//  Tippi
//
//  Created by taylorka on 6/25/19.
//  Copyright © 2019 taylorka. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *percentField;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    double userPercentage = [self.percentField.text doubleValue];
    double userDecimal = userPercentage / 100.0;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:userDecimal forKey:@"custom_tip"];
    [defaults synchronize];
    NSLog(@"Settings will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"Settings did disappear");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
