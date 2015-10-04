//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

@interface LeftMenuViewController () 

@property (nonatomic, strong) NSMutableArray *options;

@end

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
    
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    self.imavProfileImage.layer.cornerRadius = self.imavProfileImage.frame.size.width/2;
    self.imavProfileImage.clipsToBounds = YES;
    
    self.options = [[NSMutableArray alloc] initWithObjects:@"Profile", @"Settings", @"Log out", nil];
    
    _configMenu.backgroundColor = [UIColor clearColor];
    _configMenu.delegate = self;
    [_configMenu reloadData];
    
    _configMenu.dataSource = self;
    _configMenu.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableView Delegate & Datasrouce 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [_configMenu dequeueReusableCellWithIdentifier:@"menu"];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Profile";
    }
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"Settings";
    }
    else {
        cell.textLabel.text = @"Log Out";
    }
    
    cell.backgroundColor = [self colorFromHexString:@"#CC594C"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.layer.cornerRadius = 8.0f;
    
    
    
    
    return cell;
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


@end
