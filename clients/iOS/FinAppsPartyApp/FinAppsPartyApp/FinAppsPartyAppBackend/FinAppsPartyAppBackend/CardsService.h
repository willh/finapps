//
//  CardsService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

typedef void(^CardsListSuccessBlock)(NSArray *cards);

#import "BaseService.h"

@interface CardsService : BaseService

- (void)cardsListWithSuccessBlock:(CardsListSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

@end
