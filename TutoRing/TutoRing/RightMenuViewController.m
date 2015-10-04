//
//  RightMenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/26/14.
//  Copyright (c) 2014 Aryan Ghassemi. All rights reserved.
//

#import "RightMenuViewController.h"
#import "HomeViewController.h"
@implementation RightMenuViewController

#pragma mark - UIViewController Methods -

- (void)viewDidLoad
{
	[super viewDidLoad];
		
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)searching:(id)sender {
    
    [[SlideNavigationController sharedInstance] closeMenuWithCompletion:^(void) {}];
//    
//    [[SlideNavigationController sharedInstance] closeMenuWithCompletion:^(void) {
//        
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

        HomeViewController * vc = [mainStoryboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
       vc.searchString = _textField.text;
//
//    
//    }];
}


@end
