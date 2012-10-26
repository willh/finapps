//
//  BaseService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

- (id)initWithNetworkingEngine:(NetworkingEngine *)engine {
    self = [super init];
    if (self) {
        _engine = engine;
    }
    
    return self;
}

@end
