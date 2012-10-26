//
//  BaseService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseService : NSObject {

    @protected
    NetworkingEngine *_engine;
}

- (id)initWithNetworkingEngine:(NetworkingEngine *)engine;

@end
