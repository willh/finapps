//
//  AppDelegate.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/NetworkingEngine.h"
#import "FinAppsPartyAppBackend/FinAppsPartyAppBackend/CallingEngine.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (readonly, strong, nonatomic) NetworkingEngine *networkingEngine;
@property (readonly, strong, nonatomic) CallingEngine *callingEngine;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
