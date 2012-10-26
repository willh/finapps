//
//  AccountService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "AccountService.h"

@implementation AccountService

- (void)accountsListWithSuccessBlock:(AccountsSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {

    [_engine invokeGETRequestWithPath:@"operations/accounts/list" params:nil successBlock:^(NSDictionary *responseData) {
        successBlock([responseData valueForKey:@"data"]);
        
    } failureBlock:^(NSError *error) {
        UserError *userError = [UserError new];
        userError.title = @"Accounts error.";
        userError.message = [error description];
        
        failureBlock(userError);
    }];
}

@end
