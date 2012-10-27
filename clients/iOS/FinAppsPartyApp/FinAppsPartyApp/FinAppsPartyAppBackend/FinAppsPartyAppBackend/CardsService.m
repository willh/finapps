//
//  CardsService.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "CardsService.h"

@implementation CardsService

- (void)addCardWithAccountNumber:(NSString *)accountNumber cardType:(CardsServiceCardType)cardType cardsIssuer:(CardsServiceCardsIssuer)cardsIssuer successBlock:(CardSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    
    NSDictionary *parameters = @{
        @"linkAccount": accountNumber,
        @"mode": @(cardType),
        @"issuer": @(cardsIssuer)
    };
    
    [_engine invokePOSTRequestWithPath:@"operations/card/@me" data:parameters successBlock:^(NSDictionary *responseData) {
        successBlock([responseData valueForKey:@"data"]);
    } failureBlock:^(NSError *error) {
        UserError *userError = [UserError new];
        userError.title = @"Cards error.";
        userError.message = [error description];
        
        failureBlock(userError);
    }];
    
}

- (void)cardsListWithSuccessBlock:(CardsListSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    [_engine invokeGETRequestWithPath:@"operations/card/list" params:nil successBlock:^(NSDictionary *responseData) {
        successBlock([responseData valueForKey:@"data"]);
    } failureBlock:^(NSError *error) {
        UserError *userError = [UserError new];
        userError.title = @"Cards error.";
        userError.message = [error description];
        
        failureBlock(userError);        
    }];
}

- (void)cardDetailsWithId:(NSString *)cardId SuccessBlock:(CardSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock {
    
    NSString *path = [NSString stringWithFormat:@"operations/card/%@/status", cardId];
    
    [_engine invokeGETRequestWithPath:path params:nil successBlock:^(NSDictionary *responseData) {
        successBlock([responseData valueForKey:@"data"]);
    } failureBlock:^(NSError *error) {
        UserError *userError = [UserError new];
        userError.title = @"Cards error.";
        userError.message = [error description];
        
        failureBlock(userError);
    }];

}

@end
