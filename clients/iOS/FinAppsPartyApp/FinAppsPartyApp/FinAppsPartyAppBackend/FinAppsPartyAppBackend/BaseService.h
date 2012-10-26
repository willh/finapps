//
//  BaseService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Errors/UserError.h"

typedef void(^ServiceFailureBlock)(UserError *error);

@interface BaseService : NSObject {

    @protected
    NetworkingEngine *_engine;
}

- (id)initWithNetworkingEngine:(NetworkingEngine *)engine;

@end
