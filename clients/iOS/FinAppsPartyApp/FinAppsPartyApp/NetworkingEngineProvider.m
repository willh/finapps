//
//  NetworkingEngineProvider.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "NetworkingEngineProvider.h"

@implementation NetworkingEngineProvider

+ (NetworkingEngine *)networkEngine {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    return [appDelegate networkingEngine];
}

@end
