/******************************************************************************
 *  \file ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import <CoreData/CoreData.h>

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

#define CORE_DATA_FILE_NAME @"com.___ORGANIZATIONNAME___.___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.sqlite"

//Likely an Xcode bug, but as of v3.2.5, renaming the .xcdatamodeld does NOT rename the actual filename in the finder.
//You must use the filename shown in the finder, not the filename shown in the project window.
#define CORE_DATA_MOMD_FILENAME @"___PROJECTNAMEASIDENTIFIER___"

#define CORE_DATA_DISPATCH_QUEUE_LABEL_FORMAT @"com.___ORGANIZATIONNAME___.CoreDataEnvironment.dq_%d" //This must have on %d identifying the thread the dispatch queue is attached to.

#pragma mark ** Protocols & Declarations **

/*!
    @enum       ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier
    @abstract   Enum identifying the various NSManagedObjectContext instances in use in this app
    @discussion In practice, you only typically need two context:  one for the main thread,
                typically used by UI objects and one for the background thread where you can
                put longer running core data actions so they won't block the UI.

                ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentMainThreadContext must be first, and ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifierCount and
                ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifierInvalid must be last.
*/
typedef enum
{
    // Main Thread Must be 0
    ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifierMainThreadContext = 0,

    // Customize context idenfiers names below
    ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifierBackgroundContextIdentifier,     //Example background context
    ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifierCustomContextIdentifier,         //Example other context

    // Utility enums, must be last
    ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifierCount,
    ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifierInvalid
} ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier;

typedef void (^RLCoreDataErrorHandlerType)(NSError *error, SEL selectorWithError, BOOL isFatal);

@interface ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment : NSObject
{

@private
    //Internal only variables.  Use properties and accessors to access
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
    NSMutableDictionary *_managedObjectContextHash;
    NSMutableDictionary *_dispatchQueueHash;

    //leave these as nil to use the default values
    BOOL _isTestEnvironment;
    NSString *_storeType;
    NSBundle *_modelBundle;

    RLCoreDataErrorHandlerType _errorHandlerBlock;
}

#pragma mark ** Singleton Accessor **
+ (___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment *)singleton;

#pragma mark ** Properties & Accessors **
@property(retain, readonly) NSManagedObjectModel *managedObjectModel;
@property(retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(retain, readonly) NSManagedObjectContext *managedObjectContextForMainThread;
- (NSManagedObjectContext *)managedObjectContextForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (dispatch_queue_t)dispatchQueueForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
@property(copy) RLCoreDataErrorHandlerType errorHandlerBlock;

//Typically only changed for test or debug...
@property(assign) BOOL isTestEnvironment;
@property(retain, readonly) NSString *storeType;    //Default is NSSQLiteStoreType.
@property(retain, readonly) NSBundle *modelBundle;  //Default is [NSBundle mainBundle]

#pragma mark ** Helpers **

//Get NSManagedObject from an NSManagedObjectID
- (NSManagedObject *)objectForObjectID:(NSManagedObjectID *)objectID
                     contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

//get NSManagedObject form an objectIDString
- (NSManagedObject *)objectForObjectIDString:(NSString *)objectIDString
                           contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

//Save the specified context
- (NSError *)saveContextForIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

//Delete all core data items
- (void)resetCoreData;

@end
