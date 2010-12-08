/*********************************************************************
 *  \file ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.h
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class RootViewController
 *  \brief Part of ___PROJECTNAME___
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */
 
#import <CoreData/CoreData.h>

#define CORE_DATA_FILE_NAME @"com.___ORGANIZATIONNAME___.core_data.sqlite"

//Likely an Xcode bug, but as of v3.2.5, renaming the .xcdatamodeld does NOT rename the actual filename in the finder.
//You must use the filename shown in the finder, not the filename shown in the project window.
#define CORE_DATA_MOMD_FILENAME @"___PROJECTNAMEASIDENTIFIER___"

#define CORE_DATA_DISPATCH_QUEUE_LABEL_FORMAT @"com.___ORGANIZATIONNAME___.___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.dq_%d" //This should have on %d identifying the thread the dispatch queue is attached to.

/*!
    @enum       ___PROJECTNAMEASIDENTIFIER___ContextIdentifier
    @abstract   Enum identifying the various NSManagedObjectContext instances in use in this app
    @discussion In practice, you only typically need two context:  one for the main thread, 
                typically used by UI objects and one for the background thread where you can 
                put longer running core data actions so they won't block the UI.
 
                ___PROJECTNAMEASIDENTIFIER___MainThreadContext must be first, and ___PROJECTNAMEASIDENTIFIER___ContextIdentifierCount and 
                ___PROJECTNAMEASIDENTIFIER___ContextIdentifierInvalid must be last.
*/
typedef enum
{
    // Main Thread Must be 0
    ___PROJECTNAMEASIDENTIFIER___MainThreadContext = 0,
    
    // Customize context idenfiers names below
    ___PROJECTNAMEASIDENTIFIER___BackgroundContextIdentifier,     //Example background context
    RLCustomContextIdentifier,         //Example other context
    
    // Utility enums, must be last
    ___PROJECTNAMEASIDENTIFIER___ContextIdentifierCount,
    ___PROJECTNAMEASIDENTIFIER___ContextIdentifierInvalid
} ___PROJECTNAMEASIDENTIFIER___ContextIdentifier;

@interface ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment : NSObject
{

@private
    //Internal only variables.  Use properties and accessors to access
    NSManagedObjectModel *managedObjectModel_;
    NSPersistentStoreCoordinator *persistentStoreCoordinator_;
    NSMutableDictionary *managedObjectContextHash_;
    NSMutableDictionary *dispatchQueueHash_;
 
    //leave these as nil to use the default values
    BOOL isTestEnvironment_;
    NSString *storeType_;
    NSBundle *modelBundle_;
}

#pragma mark ** Singleton Accessor **
+ (___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment *)singleton;

#pragma mark ** Properties & Accessors **
@property(retain, readonly) NSManagedObjectModel *managedObjectModel;
@property(retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(retain, readonly) NSManagedObjectContext *managedObjectContextForMainThread;

//Typically only changed for test or debug...
@property(assign) BOOL isTestEnvironment;
@property(retain, readonly) NSString *storeType; //Default is nssqlstoretype.  
@property(retain, readonly) NSBundle *modelBundle; //default is [NSBundle mainBundle]

- (NSManagedObjectContext *)managedObjectContextForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;
- (dispatch_queue_t)dispatchQueueForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;

#pragma mark ** Helpers **

//Get MO from an NSManagedObjectID
- (NSManagedObject *)objectForObjectID:(NSManagedObjectID *)objectID
                     contextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;

//get MO form an objectIDString
- (NSManagedObject *)objectForObjectIDString:(NSString *)objectIDString
                           contextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;

//Save the specified context
- (NSError *)saveContextForIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;

//Delete all core data items
- (void)resetCoreData;

@end
