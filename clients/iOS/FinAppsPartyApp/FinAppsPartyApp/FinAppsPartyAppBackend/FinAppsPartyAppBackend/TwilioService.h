//
//  TwilioService.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

typedef void(^TwilioServiceSuccessfulBlock)(NSString *twilioToken);

#import "BaseService.h"

@interface TwilioService : BaseService

- (void)tokenForTwilioWithSuccessBlock:(TwilioServiceSuccessfulBlock)successBlock failureBlock:(ServiceFailureBlock)failureBlock;

@end
