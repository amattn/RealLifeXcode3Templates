/******************************************************************************
 *  \file CoreDataBook.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class CoreDataBook
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract NSManagedObject subclass.  Encapsulated functionality specific to 
 *            a given Core Data Entity. 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import <CoreData/CoreData.h>

#pragma mark ** Constant Defines **

#define CD_KEY_TITLE @"title"
#define CD_KEY_AUTHOR @"author"

#pragma mark ** Protocols & Declarations **

@interface CoreDataBook : NSManagedObject
{
    
}

#pragma mark ** Core Data Properties **

#pragma mark ** Properties **
@property (nonatomic, retain) NSString *title;

#pragma mark ** Methods **

@end
