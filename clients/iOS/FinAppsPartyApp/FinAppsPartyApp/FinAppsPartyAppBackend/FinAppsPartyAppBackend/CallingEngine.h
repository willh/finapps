//
//  CallingEngine.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"
#import "../Libs/Twilio/Headers/TCDeviceDelegate.h"

@interface CallingEngine : BaseService<TCDeviceDelegate>

- (void)connect:(NSString *)phoneNumber withCallerName:(NSString *)callerName;

- (void)disconnect;

@end
