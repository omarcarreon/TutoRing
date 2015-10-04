//
//  ViewControllerSignUp.m
//  TutoRing
//
//  Created by Alejandro Zamudio Guajardo on 10/3/15.
//  Copyright © 2015 OmarCarreon. All rights reserved.
//

#import "ViewControllerSignUp.h"

@interface ViewControllerSignUp ()

@end

@implementation ViewControllerSignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnSignUp.layer.cornerRadius = 15.0f;
    self.btnCancel.layer.cornerRadius = 15.0f;
    
    UITapGestureRecognizer *OffKeyboardtap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeKeyboard)];
    [self.view addGestureRecognizer:OffKeyboardtap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) removeKeyboard
{
    [self.view endEditing:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
