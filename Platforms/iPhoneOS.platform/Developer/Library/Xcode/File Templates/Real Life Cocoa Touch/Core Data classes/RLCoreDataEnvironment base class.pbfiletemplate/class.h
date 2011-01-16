/******************************************************************************
 *  \file «FILENAME»
 *  \author «FULLUSERNAME»
 *  \date «DATE»
 *  \class «FILEBASENAMEASIDENTIFIER»
 *  \brief Part of «PROJECTNAME»
 *  \details
 *
 *  \abstract CLASS_ABSTRACT
 *  \copyright Copyright «ORGANIZATIONNAME» «YEAR». All rights reserved.
 */

#import <CoreData/CoreData.h>

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

#define CORE_DATA_FILE_NAME @"com.«ORGANIZATIONNAME».«FILEBASENAMEASIDENTIFIER».sqlite"

//Likely an Xcode bug, but as of v3.2.5, renaming the .xcdatamodeld does NOT rename the actual filename in the finder.
//You must use the filename shown in the finder, not the filename shown in the project window.
#define CORE_DATA_MOMD_FILENAME @"«FILEBASENAMEASIDENTIFIER»"

#define CORE_DATA_DISPATCH_QUEUE_LABEL_FORMAT @"com.«ORGANIZATIONNAME».CoreDataEnvironment.dq_%d" //This must have on %d identifying the thread the dispatch queue is attached to.

#pragma mark ** Protocols & Declarations **

/*!
    @enum       «FILEBASENAMEASIDENTIFIER»ContextIdentifier
    @abstract   Enum identifying the various NSManagedObjectContext instances in use in this app
    @discussion In practice, you only typically need two context:  one for the main thread,
                typically used by UI objects and one for the background thread where you can
                put longer running core data actions so they won't block the UI.

                «FILEBASENAMEASIDENTIFIER»MainThreadContext must be first, and «FILEBASENAMEASIDENTIFIER»ContextIdentifierCount and
                «FILEBASENAMEASIDENTIFIER»ContextIdentifierInvalid must be last.
*/
typedef enum
{
    // Main Thread Must be 0
    «FILEBASENAMEASIDENTIFIER»MainThreadContext = 0,

    // Customize context idenfiers names below
    «FILEBASENAMEASIDENTIFIER»BackgroundContextIdentifier,     //Example background context
    «FILEBASENAMEASIDENTIFIER»CustomContextIdentifier,         //Example other context

    // Utility enums, must be last
    «FILEBASENAMEASIDENTIFIER»ContextIdentifierCount,
    «FILEBASENAMEASIDENTIFIER»ContextIdentifierInvalid
} «FILEBASENAMEASIDENTIFIER»ContextIdentifier;

typedef void (^RLCoreDataErrorHandlerType)(NSError *error, SEL selectorWithError, BOOL isFatal);

@interface «FILEBASENAMEASIDENTIFIER» : NSObject
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
+ («FILEBASENAMEASIDENTIFIER» *)singleton;

#pragma mark ** Properties & Accessors **
@property(retain, readonly) NSManagedObjectModel *managedObjectModel;
@property(retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(retain, readonly) NSManagedObjectContext *managedObjectContextForMainThread;
- (NSManagedObjectContext *)managedObjectContextForContextIdentifier:(«FILEBASENAMEASIDENTIFIER»ContextIdentifier)contextIdentifier;
- (dispatch_queue_t)dispatchQueueForContextIdentifier:(«FILEBASENAMEASIDENTIFIER»ContextIdentifier)contextIdentifier;
@property(copy) RLCoreDataErrorHandlerType errorHandlerBlock;

//Typically only changed for test or debug...
@property(assign) BOOL isTestEnvironment;
@property(retain, readonly) NSString *storeType;    //Default is NSSQLiteStoreType.
@property(retain, readonly) NSBundle *modelBundle;  //Default is [NSBundle mainBundle]

#pragma mark ** Helpers **

//Get NSManagedObject from an NSManagedObjectID
- (NSManagedObject *)objectForObjectID:(NSManagedObjectID *)objectID
                     contextIdentifier:(«FILEBASENAMEASIDENTIFIER»ContextIdentifier)contextIdentifier;

//get NSManagedObject form an objectIDString
- (NSManagedObject *)objectForObjectIDString:(NSString *)objectIDString
                           contextIdentifier:(«FILEBASENAMEASIDENTIFIER»ContextIdentifier)contextIdentifier;

//Save the specified context
- (NSError *)saveContextForIdentifier:(«FILEBASENAMEASIDENTIFIER»ContextIdentifier)contextIdentifier;

//Delete all core data items
- (void)resetCoreData;

@end
