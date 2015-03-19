//
//  HelloWorldViewController.h
//  droneControl
//
//  Created by BDW on 2015-03-11.
//  Copyright (c) 2015 bdw. All rights reserved.
//

#import "BMWFindParkingView.h"
#import "LastUserModeDelegate.h"

@interface HelloWorldViewController : NSObject

- (id)initWithView:(IDView *)theView;

@property (strong) BMWFindParkingView *view;
@property (weak, readwrite) id<LastUserModeDelegate> lumDelegate;

@end
