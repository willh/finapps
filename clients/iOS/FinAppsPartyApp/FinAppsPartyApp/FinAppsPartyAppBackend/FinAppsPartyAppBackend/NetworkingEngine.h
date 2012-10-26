//
//  NetworkingEngine.h
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

typedef void(^SuccessBlock)(NSDictionary *ressponseData);
typedef void(^FailureBlock)(NSError *error);

#import <Foundation/Foundation.h>

@interface NetworkingEngine : NSObject

- (id)initWithDefaultEndpointAndApiKey:(NSString *)apiKey;

- (id)initWithEndpoint:(NSString *)endpoint apiKey:(NSString *)apiKey;

- (void)setAuthenticationHeadersWithUsername:(NSString *)username password:(NSString *)password;
- (void)setHeaders:(NSDictionary *)headers;
- (void)setSecurityToken:(NSString *)token;

- (void)invokeGETRequestWithPath:(NSString *)path params:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)invokePOSTRequestWithPath:(NSString *)path data:(NSDictionary *)data successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end
