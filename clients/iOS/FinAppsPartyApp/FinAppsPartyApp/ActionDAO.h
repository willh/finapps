//
//  ActionDAO.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "BaseDAO.h"
#import "Action.h"

@interface ActionDAO : BaseDAO

- (Action *)newActionWithPropertiesCleared;
- (NSArray *)allAsDictionaries;

@end
