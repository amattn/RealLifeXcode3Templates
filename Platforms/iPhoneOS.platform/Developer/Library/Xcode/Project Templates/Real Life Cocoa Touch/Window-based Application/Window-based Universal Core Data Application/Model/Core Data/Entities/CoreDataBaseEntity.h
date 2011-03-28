/******************************************************************************
 *  \file CoreDataBaseEntity.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class CoreDataBaseEntity
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract NSManagedObject subclass.  Encapsulated functionality specific to 
 *            a given Core Data Entity. 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import <CoreData/CoreData.h>

#pragma mark ** Constant Defines **

#define CD_KEY_TS_ADD @"tsAdd"
#define CD_KEY_TS_MOD @"tsMod"

#pragma mark ** Protocols & Declarations **

@interface CoreDataBaseEntity : NSManagedObject
{
    
}

#pragma mark ** Core Data Properties **

#pragma mark ** Properties **

#pragma mark ** Methods **

@end
