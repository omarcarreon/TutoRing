//
//  HomeViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import <Mapkit/MapKit.h>

@interface HomeViewController : UIViewController <SlideNavigationControllerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *btnLeftMenu;
@property (strong, nonatomic) IBOutlet UIButton *btnRightMenu;
@property (strong, nonatomic) IBOutlet MKMapView *tutoRingMapView;
@property NSString* searchString;
@property CLLocationManager* location;
@property (strong, nonatomic) IBOutlet UIButton *buttonView;

@end
