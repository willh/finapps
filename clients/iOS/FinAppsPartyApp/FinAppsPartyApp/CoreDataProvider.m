//
//  CoreDataProvider.m
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import "CoreDataProvider.h"

@implementation CoreDataProvider

+ (void)transactionInContext:(CoreDataTransactionBlock)transactionBlock {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *mainMOC = appDelegate.managedObjectContext;
    
    NSManagedObjectContext *childMOC = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    childMOC.parentContext = mainMOC;
    
    BOOL shouldSaveMOC = transactionBlock(childMOC);
    
    if (shouldSaveMOC) {
        
        NSError *childMOCError = nil;
        if ([childMOC save:&childMOCError]) {
            
            [mainMOC performBlock:^{
                
                NSError *parentMOCError = nil;
                if ([mainMOC save:&parentMOCError]) {
                    
                    // Finally done :)
                    
                } else {
                    NSLog(@"Parent MOC save error!: %@", childMOCError);
                }
                     
            }];
            
        } else {
            NSLog(@"Child MOC save error!: %@", childMOCError);
        }
        
    }
}

@end
