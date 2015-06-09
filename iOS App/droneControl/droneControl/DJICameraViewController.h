//
//  DJICamerViewController.h
//  TestApp
//
//  Created by Ares on 14-9-11.
//  Copyright (c) 2014年 DJI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DJISDK/DJIDrone.h>
#import <DJISDK/DJICamera.h>
#import <DJISDK/DJIGimbal.h>
#import <DJISDK/DJISDK.h> //DJIDroneDelegate,
#import "DJIDroneHelper.h"
#import "DJICameraViewController.h"
#import "VideoPreviewer.h"
#import "CoordinatePointTuple.h"
#import "LocationManager.h"

/*!
 @class DJICameraViewController
 @abstract Live video feed view from drone.
 @discussion The AerialViewController displays a GoogleMapsViewController in the
 upper-left quadrant of the screen, and a live video feed from the drone in the rest of the screen.
 The user is prompted to touch a parking space. When the user touches the drone video feed,
 the touch location is translated into a GPS coordinate. The user is asked for a confirmation,
 and the app provides directions to the selected spot either by transitioning to the Google Maps app (if available)
 or highlighting the route on the existing GoogleMapsView.
 */


@interface DJICameraViewController : UIViewController<DJICameraDelegate,  DJIGimbalDelegate>
@property(nonatomic, retain) IBOutlet UIView* videoPreviewView;
@property BOOL gimbalAttitudeUpdateFlag;
@property BOOL switch_to_usb;
@property DJIDroneHelper *droneHelper;
@property NSArray * coordinatePointTuples;
@property UIView * dummyTouchView;
@property DJICamera* camera;
//media
@property DJIMedia* media;
@property NSArray* mediasList;
@property BOOL fetchingMedias;

- (void)publicViewWillAppearMethod:(BOOL) animated;

-(IBAction) onTakePhotoButtonClicked:(id)sender;

-(IBAction) onGimbalScrollDownTouchDown:(id)sender;

-(IBAction) onGimbalScrollDownTouchUp:(id)sender;

@end
