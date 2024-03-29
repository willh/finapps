//
//  ActionDAO.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "ActionDAO.h"

@implementation ActionDAO

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc {
    self = [super initWithManagedObjectContext:moc andEntityName:@"Action"];
    if (self) {
        //
    }
    
    return self;
}

- (NSArray *)allAsDictionaries {
    NSArray *actions = [self all];
    NSMutableArray *dictionaries = [NSMutableArray new];
    for (Action *action in actions) {
        [dictionaries addObject:@{
            @"description": action.actionDescription
        }];
    }
    
    return dictionaries;
}

- (Action *)newActionWithPropertiesCleared {
    Action *action = [self createObject];
    
    BaseDAO *propertiesDAO = [[BaseDAO alloc] initWithManagedObjectContext:[self managedObjectContext] andEntityName:@"Property"];
    [propertiesDAO deleteAllObjects];
    
    return action;
}

@end
