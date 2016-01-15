//
//  SplashViewController.m
//  Twozapp
//
//  Created by Priya on 13/01/16.
//  Copyright © 2016 Priya. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_activityIndicator startAnimating];
    [self performSelector:@selector(actionStop) withObject:nil afterDelay:1.0];
    // Do any additional setup after loading the view.
}

- (void)actionStop{
    [_activityIndicator stopAnimating];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *profileTwo = [story instantiateViewControllerWithIdentifier:@"ConnectFacebookViewController"];
    [self presentViewController:profileTwo animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
