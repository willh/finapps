//
//  CallingEngine.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "CallingEngine.h"
#import "TwilioService.h"

#import "TCDevice.h"
#import "TCConnection.h"

@interface CallingEngine() {
    TCDevice *_tcDevice;
    TCConnection *_tcConnection;
}

@end

@implementation CallingEngine

- (void)connect:(NSString *)phoneNumber {
    TwilioService *twilioService = [[TwilioService alloc] initWithNetworkingEngine:_engine];
    
    [twilioService tokenForTwilioWithSuccessBlock:^(NSString *twilioToken) {
        if (!_tcDevice) {
            _tcDevice = [[TCDevice alloc] initWithCapabilityToken:twilioToken delegate:self];
        }
        
        NSDictionary *parameters = nil;
        
        if ([phoneNumber length] > 0) {
            parameters = @{@"PhoneNumber": phoneNumber};
        }
        
        _tcConnection = [_tcDevice connect:parameters delegate:nil];
        
        
    } failureBlock:^(UserError *error) {
        //
    }];
}

- (void)disconnect {
    [_tcConnection disconnect];
    _tcConnection = nil;
}

#pragma mark - TCDeviceDelegate methods

- (void)device:(TCDevice *)device didReceiveIncomingConnection:(TCConnection *)connection {
    if (_tcConnection) {
		[self disconnect];
	}
	_tcConnection = connection;
	[_tcConnection accept];
}

- (void)device:(TCDevice *)device didReceivePresenceUpdate:(TCPresenceEvent *)presenceEvent {
    
}

- (void)device:(TCDevice *)device didStopListeningForIncomingConnections:(NSError *)error {
    
}

- (void)deviceDidStartListeningForIncomingConnections:(TCDevice *)device {
    
}



@end
