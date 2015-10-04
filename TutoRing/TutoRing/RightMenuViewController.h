//
//  RightMenuViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/26/14.
//  Copyright (c) 2014 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animations/SlideNavigationContorllerAnimator.h"
#import "Animations/SlideNavigationContorllerAnimatorFade.h"
#import "Animations/SlideNavigationContorllerAnimatorSlide.h"
#import "Animations/SlideNavigationContorllerAnimatorScale.h"
#import "Animations/SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "Animations/SlideNavigationContorllerAnimatorSlideAndFade.h"

@interface RightMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;

@end
