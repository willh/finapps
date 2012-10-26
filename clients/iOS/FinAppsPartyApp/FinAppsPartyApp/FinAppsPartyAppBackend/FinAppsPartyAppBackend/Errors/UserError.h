//
//  UserError.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserError : NSObject

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *title;

@end
