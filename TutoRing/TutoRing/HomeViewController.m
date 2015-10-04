//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftMenuViewController.h"

@interface HomeViewController() <CLLocationManagerDelegate>

@property CLLocationManager* location;
@property (strong, nonatomic) IBOutlet UIView *mapButtonsView;

@end

@implementation HomeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _location = [[CLLocationManager alloc] init];
    _mapButtonsView.layer.cornerRadius = 4.0f;

    [SlideNavigationController sharedInstance].portraitSlideOffset = 100;
    
//    [_btnLeftMenu setImage:[UIImage imageNamed:@"menuUnselected"] forState:UIControlStateNormal];
//    [_btnLeftMenu setImage:[UIImage imageNamed:@"menuSelected"] forState:UIControlStateSelected];
//    
//    [_btnRightMenu setImage:[UIImage imageNamed:@"searchUnselected"] forState:UIControlStateNormal];
//    [_btnRightMenu setImage:[UIImage imageNamed:@"searchSelected"] forState:UIControlStateSelected];
    
    [_btnLeftMenu addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    [_btnRightMenu addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
    
    _location.delegate = self;
    _location.desiredAccuracy =  kCLLocationAccuracyBest;
    [_location requestWhenInUseAuthorization];
    [_location startUpdatingLocation];
	
    _tutoRingMapView.delegate = self;
    
    
}

- (IBAction)returnToUserLocation:(id)sender {
    
    [_location startUpdatingLocation];
    
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


#pragma mark - MKMapViewDelegate Methods


#pragma mark - CLLocationManagerDelegate Methods

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error con el mapa");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *userLocation = (CLLocation*)locations[0];
    [_location stopUpdatingLocation];
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.5, 0.5);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    
    [_tutoRingMapView setRegion:region animated:YES];
    
    NSLog(@"%f", userLocation.coordinate.latitude);
    NSLog(@"%f", userLocation.coordinate.longitude);

    
#warning Usar método para generar MKPoints
    
    //DATOS DUMMYS
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude - 0.07, userLocation.coordinate.longitude);
    point.title = @"Elí Emmanuel";
    point.subtitle = @"PHP, iOS, Java";
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude + 0.06, userLocation.coordinate.longitude);
    point2.title = @"Armando Galván";
    point2.subtitle = @"Web Design, HTML";
    
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc] init];
    point3.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude - 0.02, userLocation.coordinate.longitude - 0.07);
    point3.title = @"Juan Flores";
    point3.subtitle = @"Branding, Marketing";
    
    MKPointAnnotation *point4 = [[MKPointAnnotation alloc] init];
    point4.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude - 0.02, userLocation.coordinate.longitude + 0.04);
    point4.title = @"Luis Felipe";
    point4.subtitle = @"Android, Physics, iOS";
    
    MKPointAnnotation *point5 = [[MKPointAnnotation alloc] init];
    point5.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude - 0.046, userLocation.coordinate.longitude - 0.066);
    point5.title = @"Omar Carreón";
    point5.subtitle = @"Dynamics, iOS";
    
    MKPointAnnotation *point6 = [[MKPointAnnotation alloc] init];
    point6.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude - 0.03, userLocation.coordinate.longitude- 0.007);
    point6.title = @"Luis Juan";
    point6.subtitle = @"Web Design, Android";
    
    MKPointAnnotation *point7 = [[MKPointAnnotation alloc] init];
    point7.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude - 0.043, userLocation.coordinate.longitude + 0.056);
    point7.title = @"Andrea Dlt";
    point7.subtitle = @"Graphic Design, Branding, Singing";
    
    [_tutoRingMapView addAnnotations:@[point, point2, point3, point4, point5, point6, point7]];
    
}





@end
