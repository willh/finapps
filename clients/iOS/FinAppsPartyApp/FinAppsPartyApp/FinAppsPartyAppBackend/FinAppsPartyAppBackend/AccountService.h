//
//  AccountService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

typedef void(^AccountsSuccessBlock)(NSArray *accounts);

#import "BaseService.h"

@interface AccountService : BaseService

- (void)accountsListWithSuccessBlock:(AccountsSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

@end
