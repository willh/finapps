//
//  Action.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 26.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Action : NSManagedObject

@property (nonatomic, retain) NSString * actionDescription;

@end
