//
//  UserService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "BaseService.h"

typedef void(^UserSuccessBlock)(NSDictionary *user);

@interface UserService : BaseService

- (void)userDataWithSuccessBlock:(UserSuccessBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

@end
