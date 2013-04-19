//
//  MapViewController.m
//  ihookupnow
//
//  Created by Daniel Brooks on 2/12/13.
//  Copyright (c) 2013 Daniel Brooks. All rights reserved.
//

#import "MapViewController.h"
#import "ProfileAnnotationView.h"
#import "ProfileAnnotation.h"

#import "CustomBottomBarViewController.h"

#define LENGTH 21


@interface MapViewController ()

@property(nonatomic,strong) IBOutlet MKMapView * mapView;
@property(nonatomic,strong) IBOutlet UIBarButtonItem * mapToggle;
@property(nonatomic,strong)CustomBottomBarViewController * customBottomBar;
@property(nonatomic,strong)NSMutableArray * annotations;
@property (nonatomic,readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) UIImage *imageForMyAnnotation;
@property (nonatomic, retain)NSMutableDictionary * params;


@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     self.customBottomBar = (CustomBottomBarViewController *)self.parentViewController;
    
    sharedClient = [HookUpAPIClient sharedClient];

    _params = [[NSMutableDictionary alloc] init];
    [_params setObject:[NSNumber numberWithInt:0] forKey:@"offset"];
    [_params setObject:[NSNumber numberWithInt:LENGTH] forKey:@"limit"];
    if (self.customBottomBar.selectedFilter == recent){
    
        [self showRecent];
    }
    if (self.customBottomBar.selectedFilter == proximity){
        
        [self showProximity];
        
    }if (self.customBottomBar.selectedFilter == hookups){
        
        [self showHookups];
        
    }if (self.customBottomBar.selectedFilter == favorites){
        
        [self showFavorites];
    }

  
}

-(void)awakeFromNib {
    

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.mapView];
    [self.mapView setShowsUserLocation:YES];
    
    [self.mapView setDelegate:self];
    
    self.customBottomBar = (CustomBottomBarViewController *)self.parentViewController;
    self.annotations = [[NSMutableArray alloc] init];
    
    for(NSDictionary * person in self.customBottomBar.people) {
        NSNumber * latitude = [person objectForKey:@"latitude"];
        NSNumber * longitude = [person objectForKey:@"longitude"];
        
        NSLog(@"Logitude %@ , latitude:%@",longitude,latitude);
        
        ProfileAnnotation * annotation = [[ProfileAnnotation alloc] initWithLocation:CLLocationCoordinate2DMake(latitude.floatValue, longitude.floatValue)];
        [annotation setProfileImage:[person objectForKey:@"image"]];
        
        [self.annotations addObject:annotation];
        [self.mapView addAnnotation:annotation];
        [self.mapView selectAnnotation:annotation animated:YES];
        break;
    }
    
    
    
    
    
    ProfileAnnotation * annotation = self.annotations.lastObject;
    
    [self.mapView setRegion:MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(0.04,0.04))];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)toggleView:(id)sender
{
    
    switch (self.mapView.mapType) {
        case MKMapTypeStandard: {
            self.mapView.mapType = MKMapTypeSatellite;
            [self.mapToggle setTitle:@"Satellite"];
        }break;
        case MKMapTypeSatellite: {
            self.mapView.mapType = MKMapTypeHybrid;
            [self.mapToggle setTitle:@"Hybrid"];
        }break;
       
        case MKMapTypeHybrid: {
            self.mapView.mapType = MKMapTypeStandard;
            [self.mapToggle setTitle:@"Standard"];
        }break;
        default:
            break;
    }
}


#pragma mark - Map Delgate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.mapView.centerCoordinate = userLocation.location.coordinate;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[ProfileAnnotation class]]){
        // Try to dequeue an existing pin view first.
        ProfileAnnotationView* pinView = (ProfileAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"ProfileAnnotationView"];
        if (!pinView){
            // If an existing pin view was not available, create one.
            pinView = [[ProfileAnnotationView alloc] initWithAnnotation:annotation
                                                       reuseIdentifier:@"ProfileAnnotationView"];
            [pinView setPinColor:MKPinAnnotationColorPurple];
            [pinView setAnimatesDrop:YES];
            [pinView setCanShowCallout:YES];
            [pinView setDraggable:YES];
        }
        else
            pinView.annotation = annotation;
        
        return pinView;
    }
    
    return nil;
}



-(void)showRecent {
    
    NSLog(@"Show recent");
    [sharedClient postPath:@"recentgrid" parameters:_params success:^(AFHTTPRequestOperation *operation,id responseObject) {
        
        id data = [HookUpUtils successRequestWithOperation:operation andReposnse:responseObject andView:self.view];
        
        if(data) {
            if(self.customBottomBar.selectedFilter == recent) {
                _recent = [[NSMutableArray alloc] init];
                if([data count] > 0) {
                    _recent = [data mutableCopy];
                    NSLog(@"recent 1%@",self.recent);
                    
                    
                }
                
                if([data count] < LENGTH) {
                    //[self.gridView setShowsInfiniteScrolling:NO];
                    
                } else {
                   // [self.gridView setShowsInfiniteScrolling:YES];
                }
                
            } else if(self.customBottomBar.selectedFilter == proximity) {
                
            }
            
            
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation,NSError * error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        _recent = [[NSMutableArray alloc] init];
        [HookUpUtils failedRequestWithOperation:operation andError:error andView:self.view];
       // [self.gridView.pullToRefreshView stopAnimating];
        
        
    }];
    
    
    
}

-(void)showProximity {
    
    NSLog(@"Show proxy");
    
    
    [sharedClient postPath:@"distancegrid" parameters:_params success:^(AFHTTPRequestOperation *operation,id responseObject) {
        
        id data = [HookUpUtils successRequestWithOperation:operation andReposnse:responseObject andView:self.view];
        
        if(data) {
            _proximity = [[NSMutableArray alloc] init];
            if([data count] > 0) {
                _proximity = [data mutableCopy];
            }
            
            if([data count] < LENGTH) {
              //  [self.gridView setShowsInfiniteScrolling:NO];
                
            } else {
               // [self.gridView setShowsInfiniteScrolling:YES];
            }
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation,NSError * error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        _proximity = [[NSMutableArray alloc] init];
        [HookUpUtils failedRequestWithOperation:operation andError:error andView:self.view];

        
    }];

}

-(void)showHookups {
    
    NSLog(@"Show hookup");
    
    [sharedClient postPath:@"myhookupsgrid" parameters:_params success:^(AFHTTPRequestOperation *operation,id responseObject) {
        
        id data = [HookUpUtils successRequestWithOperation:operation andReposnse:responseObject andView:self.view];
        
        if(data) {
            _hookups = [[NSMutableArray alloc] init];
            if([data count] > 0) {
                _hookups = [data mutableCopy];
                
                
            }
            
            if([data count] < LENGTH) {
                
            } else {
            }
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation,NSError * error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        _hookups = [[NSMutableArray alloc] init];
        
        [HookUpUtils failedRequestWithOperation:operation andError:error andView:self.view];
        
    }];

    
}

-(void)showFavorites {
    
    NSLog(@"Show fav");
    [sharedClient postPath:@"getmyfavorites" parameters:_params success:^(AFHTTPRequestOperation *operation,id responseObject) {
        
        id data = [HookUpUtils successRequestWithOperation:operation andReposnse:responseObject andView:self.view];
        
        if(data) {
            _favorites = [[NSMutableArray alloc] init];
            if([data count] > 0) {
                _favorites = [data mutableCopy];
            }
            
            if([data count] < LENGTH) {
                
            } else {
               
            }
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation,NSError * error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [HookUpUtils failedRequestWithOperation:operation andError:error andView:self.view];
        _favorites = [[NSMutableArray alloc] init];
       
        
    }];
    
}


@end
