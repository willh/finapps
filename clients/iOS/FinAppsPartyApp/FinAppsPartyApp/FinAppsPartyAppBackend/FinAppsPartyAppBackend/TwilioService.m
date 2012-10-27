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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        static NSString *token = nil;

        @synchronized(token) {
            if (token) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    successBlock(token);
                });
                return;
            }
            
            NSString *twilioServiceUrl = @"http://peaceful-sea-6196.herokuapp.com/client";
            NSURL *url = [NSURL URLWithString:twilioServiceUrl];
            NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
            [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            
            AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                token = [JSON valueForKey:@"token"];
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
    });
}

@end
