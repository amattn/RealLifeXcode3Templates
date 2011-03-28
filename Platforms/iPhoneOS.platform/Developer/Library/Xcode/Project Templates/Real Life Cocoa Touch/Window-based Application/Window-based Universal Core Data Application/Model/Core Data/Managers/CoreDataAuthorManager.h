/******************************************************************************
 *  \file CoreDataAuthorManager.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class CoreDataAuthorManager
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "RLCoreDataObjectManager.h"
#import "CoreDataAuthor.h"

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

@interface CoreDataAuthorManager : RLCoreDataObjectManager
{
    
}

#pragma mark ** Singleton Accessors **
+ (CoreDataAuthorManager *)singleton;

#pragma mark ** Core Data Properties **

#pragma mark ** Properties **

#pragma mark ** Methods **

// add custom methods here that apply to this entity.
// For example, RLBooksManager would likely contain:
//- (NSArray *)fetchAllBooksByAuthor:(RLAuthor *)someAuthor
//                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

@end
