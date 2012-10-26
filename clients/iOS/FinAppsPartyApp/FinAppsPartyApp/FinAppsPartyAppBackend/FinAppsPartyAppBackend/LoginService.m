//
//  LoginService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

- (void)loginWithUsername:(NSString *)userName password:(NSString *)password successBlock:(LoginSuccessfulBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    [_engine setAuthenticationHeadersWithUsername:userName password:password];
    [_engine invokeGETRequestWithPath:@"access/login" params:nil successBlock:^(NSDictionary *responseData) {
        NSLog(@"Login dict: %@", responseData);
    } failureBlock:^(NSError *error) {
        NSLog(@"DAMN IT! %@", error);
    }];
}

@end
