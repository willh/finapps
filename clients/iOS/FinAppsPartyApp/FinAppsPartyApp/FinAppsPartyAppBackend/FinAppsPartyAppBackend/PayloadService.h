//
//  PayloadService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "BaseService.h"

typedef void(^PayloadSuccessfulBlock)(NSDictionary *response);

@interface PayloadService : BaseService

- (void)sendPayloadWithToken:(NSString *)token userId:(NSString *)userId context:(NSString *)context actions:(NSArray *)actions properties:(NSDictionary *)properties successBlock:(PayloadSuccessfulBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

@end
