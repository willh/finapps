//
//  UserDAO.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "UserDAO.h"

@implementation UserDAO

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc {
    self = [super initWithManagedObjectContext:moc andEntityName:@"User"];
    if (self) {
        //
    }
    
    return self;
}

- (User *)recentUser {
    NSFetchRequest *fetchRequest = [self fetchRequest];
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:NO]]];
    
    NSArray *results = [[self managedObjectContext] executeFetchRequest:fetchRequest error:nil];
    if ([results count] > 0) {
        return results[0];
    } else {
        return nil;
    }
}

@end
