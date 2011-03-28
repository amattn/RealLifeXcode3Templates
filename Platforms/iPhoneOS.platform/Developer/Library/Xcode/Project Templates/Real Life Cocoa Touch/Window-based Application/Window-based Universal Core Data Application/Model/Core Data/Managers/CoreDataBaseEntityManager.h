/******************************************************************************
 *  \file CoreDataBaseEntityManager.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class CoreDataBaseEntityManager
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "RLCoreDataObjectManager.h"

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

@interface CoreDataBaseEntityManager : RLCoreDataObjectManager
{
    
}

#pragma mark ** Singleton Accessors **
+ (CoreDataBaseEntityManager *)singleton;

#pragma mark ** Core Data Properties **

#pragma mark ** Properties **

#pragma mark ** Methods **

// add custom methods here that apply to this entity.
// For example, RLBooksManager would likely contain:
//- (NSArray *)fetchAllBooksByAuthor:(RLAuthor *)someAuthor
//                 contextIdentifier:(RLContextIdentifier)contextIdentifier;

@end
