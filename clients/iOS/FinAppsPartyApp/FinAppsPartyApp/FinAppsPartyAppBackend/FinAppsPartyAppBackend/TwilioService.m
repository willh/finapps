//
//  TwilioService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "TwilioService.h"
#import "AFNetworking.h"

@implementation TwilioService

- (void)tokenForTwilioWithSuccessBlock:(TwilioServiceSuccessfulBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    NSString *twilioServiceUrl = @"http://polar-springs-5033.herokuapp.com/client";
    NSURL *url = [NSURL URLWithString:twilioServiceUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSString *token = [JSON valueForKey:@"token"];
        NSLog(@"Twilio token: %@", token);
        successBlock(token);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        UserError *userError = [UserError new];
        userError.title = @"Twilio error.";
        userError.message = [error description];
        
        failureBlock(userError);
    }];
    
    [operation start];
}

@end
