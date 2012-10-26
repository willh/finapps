//
//  BaseDAO.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "BaseDAO.h"

@interface BaseDAO() {
    NSString *_entityName;
    NSManagedObjectContext *_moc;
}

@end

@implementation BaseDAO

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc andEntityName:(NSString *)entityName {
    self = [super init];
    if (self) {
        _entityName = entityName;
        _moc = moc;
    }
    return self;
}

- (NSFetchRequest *)fetchRequest {
    return [NSFetchRequest fetchRequestWithEntityName:_entityName];
}

- (NSManagedObjectContext *)managedObjectContext {
    return _moc;
}

- (id)createObject {
    return [NSEntityDescription insertNewObjectForEntityForName:_entityName inManagedObjectContext:_moc];
}

- (NSArray *)all {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:_entityName];
    return [_moc executeFetchRequest:fetchRequest error:nil];
}

- (void)deleteAllObjects {
    for (NSManagedObject *managedObject in [self all]) {
        [_moc deleteObject:managedObject];
    }
}

@end
