//
//  CardsService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "BaseService.h"

typedef void(^CardsListSuccessBlock)(NSArray *cards);
typedef void(^CardSuccessBlock)(NSDictionary *cardData);

typedef enum {
    CardsServiceCardIssuerVisaClassic,
    CardsServiceCardIssuerVisaGold,
    CardsServiceCardIssuerAmex
} CardsServiceCardsIssuer;

typedef enum {
    CardsServiceCardTypeCredit,
    CardsServiceCardTypeDebit
} CardsServiceCardType;

@interface CardsService : BaseService

- (void)addCardWithAccountNumber:(NSString *)accountNumber cardType:(CardsServiceCardType)cardType cardsIssuer:(CardsServiceCardsIssuer)cardsIssuer successBlock:(CardSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

- (void)cardsListWithSuccessBlock:(CardsListSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

- (void)cardDetailsWithId:(NSString *)cardId SuccessBlock:(CardSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

@end
