//
//  SelectCourseViewController.m
//  TutoRing
//
//  Created by Alejandro Zamudio Guajardo on 10/4/15.
//  Copyright © 2015 OmarCarreon. All rights reserved.
//

#import "SelectCourseViewController.h"

@interface SelectCourseViewController (){
    NSMutableArray *pickerData;
    NSString *category;
    NSString *course;
}

@end

@implementation SelectCourseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pickerData = @[@"Development", @"Business", @"Design", @"Marketing", @"Engineering"];
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
    [self.backbutton setHidden:YES];
    [self.submitbutton setHidden:YES];
    [self.continuebutton setHidden:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectCourse:(UIButton *)sender {
    [self.backbutton setHidden:NO];
    [self.submitbutton setHidden:NO];
    [self.continuebutton setHidden:YES];
    NSInteger row;
    self.lblMessage.text = @"Please choose a Course";
    row = [self.picker selectedRowInComponent:0];
    category = [pickerData objectAtIndex:row];
    
    if ([category isEqualToString:@"Development"]){
        pickerData = @[@"iOS", @"Java", @"SQL", @"HTML", @"PHP", @"Android"];
    } else if([category isEqualToString:@"Business"]){
        pickerData = @[@"iOS", @"Java", @"SQL", @"HTML", @"PHP", @"Android"];
    } else if ([category isEqualToString:@"Design"]) {
        pickerData = @[@"iOS", @"Java", @"SQL", @"HTML", @"PHP", @"Android"];
    } else if ([category isEqualToString:@"Marketing"]) {
        pickerData = @[@"iOS", @"Java", @"SQL", @"HTML", @"PHP", @"Android"];
    } else if ([category isEqualToString:@"Design"]) {
        pickerData = @[@"iOS", @"Java", @"SQL", @"HTML", @"PHP", @"Android"];
    } else {
        pickerData = @[@"iOS", @"Java", @"SQL", @"HTML", @"PHP", @"Android"];
    }
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
        
    
}

- (IBAction)submit:(UIButton *)sender {
    NSInteger row;
    row = [self.picker selectedRowInComponent:0];
    course = [pickerData objectAtIndex:row];
    if (![course isEqual:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome!"                    message:@"Registration was successful"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}

- (IBAction)backToCategory:(UIButton *)sender {
    [self viewDidLoad];
}
@end
