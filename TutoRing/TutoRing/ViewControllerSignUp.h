//
//  ViewControllerSignUp.h
//  TutoRing
//
//  Created by Alejandro Zamudio Guajardo on 10/3/15.
//  Copyright © 2015 OmarCarreon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerSignUp : UIViewController

// Outlets
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfAddress;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfConfirmPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;

@end
