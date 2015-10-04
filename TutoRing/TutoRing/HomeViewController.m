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
    
#warning Usar método para generar MKPoints
    
    //DATOS DUMMYS
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm Here!!";
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude - 0.001, userLocation.coordinate.longitude);
    point2.title = @"Whuuuut?";
    point2.subtitle = @"!?!?!?!?";
    
    [_tutoRingMapView addAnnotations:@[point, point2]];
    
}


@end
