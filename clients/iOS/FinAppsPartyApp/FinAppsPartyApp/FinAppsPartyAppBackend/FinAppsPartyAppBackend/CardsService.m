//
//  CardsService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "CardsService.h"

@implementation CardsService


- (void)cardsListWithSuccessBlock:(CardsListSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    [_engine invokeGETRequestWithPath:@"operations/card/list" params:nil successBlock:^(NSDictionary *responseData) {
        successBlock([responseData valueForKey:@"data"]);
    } failureBlock:^(NSError *error) {
        UserError *userError = [UserError new];
        userError.title = @"Accounts error.";
        userError.message = [error description];
        
        failureBlock(userError);        
    }];
}

@end
