//
//  NetworkingEngine.m
//  FinAppsPartyAppBackend
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 YOLO. All rights reserved.
//

#import "NetworkingEngine.h"
#import "AFNetworking.h"

@interface NetworkingEngine() {
    AFHTTPClient *_httpClient;
    
    NSString *_fullEndPoint;
}

@end

@implementation NetworkingEngine

- (id)initWithDefaultEndpointAndApiKey:(NSString *)apiKey {
    self = [self initWithEndpoint:@"http://finappsapi.bdigital.org/api/2012" apiKey:apiKey];
    if (self) {
        // Whatever
    }
    return self;
}

- (id)initWithEndpoint:(NSString *)endpoint apiKey:(NSString *)apiKey {
    if (self = [super init]) {
        _fullEndPoint = [NSString stringWithFormat:@"%@/%@", endpoint, apiKey];
        NSURL *url = [NSURL URLWithString:_fullEndPoint];
        _httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
        [_httpClient setDefaultHeader:@"Content-type" value:@"application/json"];
        _httpClient.parameterEncoding = AFJSONParameterEncoding;
    }
    
    return self;
}

- (void)setAuthenticationHeadersWithUsername:(NSString *)username password:(NSString *)password {
    [_httpClient setAuthorizationHeaderWithUsername:username password:password];
}

- (void)setHeaders:(NSDictionary *)headers {
    for (NSString *key in [headers allKeys]) {
        [_httpClient setDefaultHeader:key value:[headers valueForKey:key]];
    }
}

- (void)setSecurityToken:(NSString *)token {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", _fullEndPoint, token]];
    _httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    [_httpClient setDefaultHeader:@"Content-type" value:@"application/json"];
    _httpClient.parameterEncoding = AFJSONParameterEncoding;
}

- (void)invokeGETRequestWithPath:(NSString *)path params:(NSDictionary *)params successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [_httpClient getPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSError *error = nil;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            successBlock(jsonDict);
        } else {
            failureBlock(error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        failureBlock(error);
    }];
}

- (void)invokePOSTRequestWithPath:(NSString *)path data:(NSDictionary *)data successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [_httpClient postPath:path parameters:data success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSError *error = nil;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            successBlock(jsonDict);
        } else {
            failureBlock(error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        failureBlock(error);
    }];
}



@end
