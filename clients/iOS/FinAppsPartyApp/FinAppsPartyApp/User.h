//
//  User.h
//  FinAppsPartyApp
//
//  Created by Tomasz Janeczko on 27.10.2012.
//  Copyright (c) 2012 Tomasz Janeczko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * secondName;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * streetNumber;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * postalCode;
@property (nonatomic, retain) NSString * country;

@end
