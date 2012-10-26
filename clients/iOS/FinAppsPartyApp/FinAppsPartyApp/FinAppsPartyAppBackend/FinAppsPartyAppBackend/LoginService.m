//
//  LoginService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

- (void)loginWithUsername:(NSString *)userName password:(NSString *)password successBlock:(LoginSuccessfulBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    
    [_engine setAuthenticationHeadersWithUsername:userName password:password];
    [_engine invokeGETRequestWithPath:@"access/login" params:nil successBlock:^(NSDictionary *responseData) {
        NSString *token = [responseData valueForKey:@"token"];
        
        // Set the security token in the Networking Engine
        [_engine setSecurityToken:token];
        
        successBlock(token);
    } failureBlock:^(NSError *error) {
        
        UserError *userError = [UserError new];
        if (error.code == -1011) { //AFNetworking Domain Code for failed auth
            userError.title = @"Login failed";
            userError.message = @"Please check your credentials";
            
            failureBlock(userError);
        } else {
            userError.title = @"Error";
            userError.message = [error description];
        }
    }];
}

@end
