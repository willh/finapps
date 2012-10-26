//
//  CoreDataProvider.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^CoreDataTransactionBlock)(NSManagedObjectContext *managedObjectContext);

@interface CoreDataProvider : NSObject

+ (void)transactionInContext:(CoreDataTransactionBlock)transactionBlock;

@end
