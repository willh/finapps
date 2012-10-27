//
//  PayloadService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "PayloadService.h"
#import "AFNetworking.h"

@implementation PayloadService

- (void)sendPayloadWithToken:(NSString *)token userId:(NSString *)userId context:(NSString *)context actions:(NSArray *)actions properties:(NSArray *)properties successBlock:(PayloadSuccessfulBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    
    NSURL *url = [NSURL URLWithString:@"http://finappspayload.herokuapp.com/payload"];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    httpClient.parameterEncoding = AFJSONParameterEncoding;
    [httpClient setDefaultHeader:@"Accept" value:@"application/json"];
    
    if (!actions) {
        actions = @[];
    }
    
    if (!properties) {
        properties = @[];
    }
    
    NSDictionary *parameters = @{
        @"payload": @{
            @"token": token,
            @"data": @{
                @"customerId": userId,
                @"context": context,
                @"actions": actions,
                @"properties": properties
            }
        }
    };
    
    [httpClient postPath:@"store" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        successBlock(nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UserError *userError = [UserError new];
        userError.title = @"Payload error.";
        userError.message = [error description];
        
        failureBlock(userError);
    }];
}

@end
