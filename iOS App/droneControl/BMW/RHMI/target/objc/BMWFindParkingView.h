// ************************************************
//
// generated by RHMI Editor 2.3.0 (Build: 2.3 (201407241506))
// project name: ConnectedDrone
//
// THIS IS GENERATED CODE, DON'T TOUCH!
//
// ************************************************

#import <Foundation/Foundation.h>

#import <BMWAppKit/BMWAppKit.h>

@interface BMWFindParkingView : IDView

- (id)initWithHmiState:(NSInteger)hmiState
            titleModel:(IDModel *)titleModel
            focusEvent:(NSInteger)focusEvent
           hmiProvider:(id<IDHmiProvider>)hmiProvider;

@property (strong, readonly) IDImage *navigationImage;
@property (strong, readonly) IDLabel *status;

@end
