//
//  BaseDAO.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDAO : NSObject

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc;
- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc andEntityName:(NSString *)entityName;
- (NSFetchRequest *)fetchRequest;
- (NSManagedObjectContext *)managedObjectContext;

- (id)createObject;

- (NSArray *)all;

- (void)deleteAllObjects;

@end
