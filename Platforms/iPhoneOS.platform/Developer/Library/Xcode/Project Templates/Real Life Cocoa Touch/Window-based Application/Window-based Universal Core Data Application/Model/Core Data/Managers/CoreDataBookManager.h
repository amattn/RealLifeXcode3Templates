/******************************************************************************
 *  \file CoreDataBookManager.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class CoreDataBookManager
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "RLCoreDataObjectManager.h"
#import "CoreDataBook.h"

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

@class CoreDataAuthor;

@interface CoreDataBookManager : RLCoreDataObjectManager
{
    
}

#pragma mark ** Singleton Accessors **
+ (CoreDataBookManager *)singleton;

#pragma mark ** Core Data Properties **

#pragma mark ** Properties **

#pragma mark ** Methods **

// add custom methods here that apply to this entity.
// For example, RLBooksManager would likely contain:
- (NSArray *)fetchAllBooksByAuthor:(CoreDataAuthor *)someAuthor
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

@end
