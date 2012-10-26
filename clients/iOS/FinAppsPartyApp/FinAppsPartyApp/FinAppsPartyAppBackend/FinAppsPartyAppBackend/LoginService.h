//
//  LoginService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "BaseService.h"

typedef void(^LoginSuccessfulBlock)(NSString *token);

@interface LoginService : BaseService

- (void)loginWithUsername:(NSString *)userName password:(NSString *)password successBlock:(LoginSuccessfulBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

@end
