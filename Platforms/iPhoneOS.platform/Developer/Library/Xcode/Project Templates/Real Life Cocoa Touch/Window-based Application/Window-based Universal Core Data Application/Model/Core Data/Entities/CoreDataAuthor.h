/******************************************************************************
 *  \file CoreDataAuthor.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class CoreDataAuthor
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract NSManagedObject subclass.  Encapsulated functionality specific to 
 *            a given Core Data Entity. 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import <CoreData/CoreData.h>

#pragma mark ** Constant Defines **

#define CD_KEY_NAME @"name"

#pragma mark ** Protocols & Declarations **

@interface CoreDataAuthor : NSManagedObject
{
    
}

#pragma mark ** Core Data Properties **

@property (nonatomic, retain) NSString * name;

#pragma mark ** Properties **

#pragma mark ** Methods **

@end
