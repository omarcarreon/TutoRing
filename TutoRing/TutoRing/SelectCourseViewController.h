//
//  SelectCourseViewController.h
//  TutoRing
//
<<<<<<< HEAD
//  Created by Elí Emmanuel on 10/4/15.
=======
//  Created by Alejandro Zamudio Guajardo on 10/4/15.
>>>>>>> origin/signupcontroller
//  Copyright © 2015 OmarCarreon. All rights reserved.
//

#import <UIKit/UIKit.h>

<<<<<<< HEAD
@interface SelectCourseViewController : UIViewController

=======
@interface SelectCourseViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)selectCourse:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *continuebutton;
- (IBAction)submit:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitbutton;
- (IBAction)backToCategory:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *backbutton;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
>>>>>>> origin/signupcontroller
@end
