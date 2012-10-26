//
//  UserDAO.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "BaseDAO.h"
#import "User.h"

@interface UserDAO : BaseDAO

- (User *)recentUser;

@end
