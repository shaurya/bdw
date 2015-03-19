// ************************************************
//
// generated by RHMI Editor 2.3.0 (Build: 2.3 (201407241506))
// project name: HelloWorld
//
// THIS IS GENERATED CODE, DON'T TOUCH!
//
// ************************************************

#import "WidgetsOverviewView.h"


@interface WidgetsOverviewView()

@property (strong, readwrite) IDButton *buttonImage;

@end



@implementation WidgetsOverviewView

- (id)initWithHmiState:(NSInteger)hmiState
            titleModel:(IDModel *)titleModel
            focusEvent:(NSInteger)focusEvent
           hmiProvider:(id<IDHmiProvider>)hmiProvider
{
    if (self = [super initWithHmiState:hmiState titleModel:titleModel focusEvent:focusEvent])
    {
        _buttonImage = [[IDButton alloc] initWithWidgetId:14
                                                    model:[hmiProvider modelForId:IDInvalidModelId]
                                               imageModel:[hmiProvider modelForId:IDInvalidModelId]
                                              targetModel:[hmiProvider modelForId:IDInvalidModelId]
                                                 actionId:15
                                                  focusId:16];


        _buttonImage.visible = YES;
        _buttonImage.enabled = YES;
        _buttonImage.selectable = YES;
        [self addWidget:_buttonImage];

    }
    return self;
}

- (void)dealloc
{
    [self removeWidget:_buttonImage];
}


@end
