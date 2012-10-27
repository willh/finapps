//
//  UserService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "UserService.h"


@implementation UserService

- (void)userDataWithSuccessBlock:(UserSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    [_engine invokeGETRequestWithPath:@"operations/client/profile/@me" params:nil successBlock:^(NSDictionary *ressponseData) {
        successBlock([ressponseData valueForKey:@"data"]);
    } failureBlock:^(NSError *error) {
        UserError *userError = [UserError new];
        userError.title = @"Profile error.";
        userError.message = [error description];
        
        failureBlock(userError);
    }];
}

@end
