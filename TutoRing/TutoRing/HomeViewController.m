//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"

@interface HomeViewController()


@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [SlideNavigationController sharedInstance].portraitSlideOffset = 100;
    
//    [_btnLeftMenu setImage:[UIImage imageNamed:@"menuUnselected"] forState:UIControlStateNormal];
//    [_btnLeftMenu setImage:[UIImage imageNamed:@"menuSelected"] forState:UIControlStateSelected];
//    
//    [_btnRightMenu setImage:[UIImage imageNamed:@"searchUnselected"] forState:UIControlStateNormal];
//    [_btnRightMenu setImage:[UIImage imageNamed:@"searchSelected"] forState:UIControlStateSelected];
    
    [_btnLeftMenu addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    [_btnRightMenu addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
    
	
}

#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    
    
	return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return YES;
}



-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
