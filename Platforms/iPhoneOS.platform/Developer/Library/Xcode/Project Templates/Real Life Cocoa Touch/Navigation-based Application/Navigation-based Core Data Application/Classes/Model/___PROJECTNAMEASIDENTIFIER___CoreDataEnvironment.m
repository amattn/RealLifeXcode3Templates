/******************************************************************************
 *  \file ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.m
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment
 *  \brief Part of ___PROJECTNAME___
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.h"
#include "TargetConditionals.h"

@interface ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment ()
@property (retain) NSMutableDictionary *managedObjectContextHash;
@property (retain) NSMutableDictionary *dispatchQueueHash;

@property(retain, readwrite) NSString *storeType;
@property(retain, readwrite) NSBundle *modelBundle;
@end

@implementation ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment

@synthesize managedObjectContextHash = _managedObjectContextHash;
@synthesize dispatchQueueHash = _dispatchQueueHash;
@synthesize errorHandlerBlock = _errorHandlerBlock;
@synthesize storeType = _storeType;
@synthesize modelBundle = _modelBundle;
@synthesize isTestEnvironment = _isTestEnvironment;

#pragma mark ** Static Variables **

static ___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment *__sharedCoreDataEnvironment = nil;

#pragma mark ** Singleton **

+ (___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment *)singleton;
{
    @synchronized(self) {
        if (__sharedCoreDataEnvironment == nil) {
            __sharedCoreDataEnvironment = [[self alloc] init];
        }
    }
    return __sharedCoreDataEnvironment;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (__sharedCoreDataEnvironment == nil) {
            __sharedCoreDataEnvironment = [super allocWithZone:zone];
            return __sharedCoreDataEnvironment;
        }
    }
    return nil;
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Lifecyle Methods **

- (id)init
{
    if (self = [super init])
    {
        self.managedObjectContextHash = [NSMutableDictionary dictionaryWithCapacity:___PROJECTNAMEASIDENTIFIER___ContextIdentifierCount];
        self.dispatchQueueHash = [NSMutableDictionary dictionaryWithCapacity:___PROJECTNAMEASIDENTIFIER___ContextIdentifierCount];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleManagedObjectContextDidSave:)
                                                     name:NSManagedObjectContextDidSaveNotification
                                                   object:nil];

        //simple default error handler
        self.errorHandlerBlock = ^(NSError *error, SEL selectorWithError, BOOL isFatal) {
            // typically, errors fall into one of two classes, fatal and non-fatal.
            
            NSLog(@"selectorWithError %@", NSStringFromSelector(selectorWithError));
            NSLog(@"error %@", error);

            if (isFatal) {
                NSAssert(NO, @"FATAL CORE DATA ERROR");
                abort();
                /*
                 Replace this implementation with code to handle the error appropriately.

                 abort() causes the application to generate a crash log and terminate.
                 NSAssert() will trigger an assert and bring up the debugger in debug mode, 
                 or just crash otherwise.

                 You should not use this function in a shipping application, although it
                 may be useful during development. If it is not possible to recover
                 from the error, display an alert panel that instructs the user to quit
                 the application by pressing the Home button.
                 */
            }
        };
    }
    return self;
}

- (void)dealloc
{
    self.managedObjectContextHash = nil;
    self.dispatchQueueHash = nil;
    [super dealloc];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Filesystem Utilities **

/*!
    @method     persistentStoreDirectory
    @abstract   Convenience method to directory where the core data DB is stored
    @result     Path to directory as a string
*/
- (NSString *)persistentStoreDirectory;
{
    //A good default is the user's documents directory.
    //Feel free to customize here.
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Helpers **

- (NSManagedObject *)objectForObjectID:(NSManagedObjectID *)objectID
                     contextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContextForContextIdentifier:contextIdentifier];
    NSManagedObject *managedObject = [managedObjectContext existingObjectWithID:objectID
                                                                          error:&error];
    if (error) {
        self.errorHandlerBlock(error, _cmd, NO);
        return nil;
    }
    return managedObject;
}

/*!
    @method     objectForObjectIDString:
    @abstract   Convenience method to get an NSManagedObject from it's ID
    @discussion CoreData ManagedObjectContext's aren't truly thread-safe.  If passing
                CoreData objects between threads, you must only pass the ID and
                not the object itself.
    @param      objectIDString String representation of an NSManagedObjectID
    @result     NSManagedObject for the specified objectIDString
*/
- (NSManagedObject *)objectForObjectIDString:(NSString *)objectIDString
                           contextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;
{
    NSURL *url = [NSURL URLWithString:objectIDString];
    if ([[url scheme] isEqualToString:@"x-coredata"]) {
        NSManagedObjectID *objectID = [self.persistentStoreCoordinator managedObjectIDForURIRepresentation:url];
        return [self objectForObjectID:objectID contextIdentifier:contextIdentifier];
    } else {
        NSString *errorDescription = [NSString stringWithFormat:@"Could not get object for ObjectIDString %@ in %@", objectIDString, NSStringFromSelector(_cmd)];
        NSError *error = RLQUICK_ERROR(23384, errorDescription); //random, arbitrary error code.
        self.errorHandlerBlock(error, _cmd, NO);
    }
    return nil;
}

/*!
    @method     saveContextForIdentifier:
    @abstract   Save the specified context
    @discussion <#(comprehensive description)#>
    @param      contextIdentifier <#(description)#>
    @result     <#(description)#>
*/
- (NSError *)saveContextForIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;
{
    NSError *error = nil;
    [self.persistentStoreCoordinator lock];
    NSManagedObjectContext *context = [self managedObjectContextForContextIdentifier:contextIdentifier];
    [context save:&error];

    if (error) {
        self.errorHandlerBlock(error, _cmd, YES);
    }
    [self.persistentStoreCoordinator unlock];
    return error;
}

/*!
    @method     resetCoreData
    @abstract   Delete all core data items
    @discussion Primarily used for testing.
*/
- (void)resetCoreData;
{
    for (NSValue *queuePointer in [self.dispatchQueueHash allValues]) {
        dispatch_queue_t dispatchQueue = [queuePointer pointerValue];
        dispatch_release(dispatchQueue);
    }
    self.dispatchQueueHash = [NSMutableDictionary dictionaryWithCapacity:___PROJECTNAMEASIDENTIFIER___ContextIdentifierCount];
    self.managedObjectContextHash = [NSMutableDictionary dictionaryWithCapacity:___PROJECTNAMEASIDENTIFIER___ContextIdentifierCount];

    [_managedObjectModel release];
    _managedObjectModel = nil;

    NSArray *stores = [self.persistentStoreCoordinator persistentStores];
    for (NSPersistentStore *store in stores) {
        [self.persistentStoreCoordinator removePersistentStore:store error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    }

    [_persistentStoreCoordinator release];
    _persistentStoreCoordinator = nil;
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Core Data Notifications **

/*!
    @method     handleManagedObjectContextDidSave:
    @abstract   updated all contexts when a context performs a save operation
    @discussion Changes to ManagedObjectContext happen in isolation.  If a context performs a save,
                the best thing to do is notify _all_ other contexts about the change.
                This method does exactly that via the built-in convience method
                mergeChangesFromContextDidSaveNotification
    @param      notification
*/
- (void)handleManagedObjectContextDidSave:(NSNotification *)notification;
{
    NSManagedObjectContext *notificationFromContext = [notification object];

#if (TARGET_IPHONE_SIMULATOR)
    NSAssert([notificationFromContext isKindOfClass:[NSManagedObjectContext class]], @"%@: unexpected class in notification object", NSStringFromSelector(_cmd));
#endif

    //Here if a certain context send a didSave notification, we have to notify all other context of the changes.

    for (id key in [self.managedObjectContextHash allKeys]) {
        NSManagedObjectContext *contextToUpdate = [self.managedObjectContextHash objectForKey:key];

        //we don't need to update the context that sends the update...
        if (notificationFromContext != contextToUpdate) {
            NSValue *queuePointer = [self.dispatchQueueHash objectForKey:key];
            dispatch_queue_t dispatchQueue = [queuePointer pointerValue];
            dispatch_async(dispatchQueue, ^{
                [contextToUpdate mergeChangesFromContextDidSaveNotification:notification];
                [contextToUpdate processPendingChanges];
            });
        }
    }
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Core Data Accesssors **

/*!
    @method     dispatchQueueForContextIdentifier:
    @abstract   returns a GCD dispatch queue for a given context identifier
    @discussion Core Data best practices include that you should have at
                least one moc per dispatch queue.  This particular RL
                implementation uses a single moc per queue.  This method
                will create (if necessary) and return the queue associated
                with the given context identifier.
    @param      contextIdentifier
    @result     GCD dispatch queue for a given context identifier
*/
- (dispatch_queue_t)dispatchQueueForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;
{
    id key = [NSNumber numberWithInteger:contextIdentifier];
    if (contextIdentifier == ___PROJECTNAMEASIDENTIFIER___MainThreadContext)
        return  dispatch_get_main_queue();

    NSValue *wrapper = [self.dispatchQueueHash objectForKey:key];

    if (wrapper) {
        dispatch_queue_t dispatchQueue = [wrapper pointerValue];
        return dispatchQueue;
    } else {
        //create the dispatch queue
        const char *label = NULL;
        NSString *stringLabel = [NSString stringWithFormat:CORE_DATA_DISPATCH_QUEUE_LABEL_FORMAT, contextIdentifier];
        label = [stringLabel UTF8String];

        dispatch_queue_t dispatchQueue = dispatch_queue_create(label, NULL);
        wrapper = [NSValue valueWithPointer:dispatchQueue];
        [self.dispatchQueueHash setObject:wrapper forKey:key];
        return dispatchQueue;
    }
}

/*!
    @method     managedObjectContextForContextIdentifier:
    @abstract   returns the managedObjectContext for the specified identifier
    @discussion Typically, each thread will have it's own managedObjectContext.
    @param      contextIdentifier enum identifying the managedObjectContext we
                are trying to retrieve.
    @result     NSManagedObjectContext object
*/
- (NSManagedObjectContext *)managedObjectContextForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___ContextIdentifier)contextIdentifier;
{
    id key = [NSNumber numberWithInteger:contextIdentifier];
    NSManagedObjectContext *managedObjectContext = [self.managedObjectContextHash objectForKey:key];
    if (managedObjectContext)
        return managedObjectContext;

    NSPersistentStoreCoordinator *coordinator = self.persistentStoreCoordinator;
    if (coordinator != nil) {
        managedObjectContext = [[[NSManagedObjectContext alloc] init] autorelease];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
        [self.managedObjectContextHash setObject:managedObjectContext forKey:key];
        return managedObjectContext;
    } else {
        NSString *errorDescription = @"Fatal Error: NSPersistentStoreCoordinator cannot be nil";
        NSError *error = RLQUICK_ERROR(58172, errorDescription); //random, arbitrary error code.
        self.errorHandlerBlock(error, _cmd, YES);
        return nil;
    }
}

/*!
    @method     managedObjectContextForMainThread
    @abstract   Convenience method used to get main thread managedObjectContext
    @discussion The user facing UI is almost always run on the main thread.
                This is a simple helper method due to the frequecy of usage of
                this particular moc.
    @result     the NSManagedObjectContext object for the main thread;
*/
- (NSManagedObjectContext *)managedObjectContextForMainThread;
{
    return [self managedObjectContextForContextIdentifier:___PROJECTNAMEASIDENTIFIER___MainThreadContext];
}

/*!
    @method     managedObjectModel
    @abstract   Returns the managed object model for the application.
    @discussion If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
    @result     NSManagedObjectModel
*/
- (NSManagedObjectModel *)managedObjectModel;
{
    if (_managedObjectModel != nil)
        return _managedObjectModel;

    NSBundle *bundle = self.modelBundle;
    NSAssert(bundle, @"app bundle must not be nil");
    NSURL *modelURL = [bundle URLForResource:CORE_DATA_MOMD_FILENAME withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];

    // A Unit test bundle requires a slightly different syntax to load then an app bundle.
    if (_managedObjectModel == nil) {
        NSArray *array = [NSArray arrayWithObject:bundle];
        _managedObjectModel = [[NSManagedObjectModel mergedModelFromBundles:array] retain];
    }

    if (_managedObjectModel == nil) {
        NSString *errorDescription = @"Fatal Error: _managedObjectModel cannot be nil";
        NSError *error = RLQUICK_ERROR(72081, errorDescription); //random, arbitrary error code.
        self.errorHandlerBlock(error, _cmd, YES);
        return nil;
    }

    return _managedObjectModel;
}

/*!
    @method     persistentStoreCoordinator
    @abstract   Returns the persistent store coordinator for the application.
    @discussion If the coordinator doesn't already exist, it is created and the application's store added to it.
    @result     NSPersistentStoreCoordinator
*/
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
{
    if (_persistentStoreCoordinator)
        return _persistentStoreCoordinator;

    NSURL *storeUrl = [NSURL fileURLWithPath: [[self persistentStoreDirectory] stringByAppendingPathComponent:CORE_DATA_FILE_NAME]];

    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];

    if (![_persistentStoreCoordinator addPersistentStoreWithType:self.storeType configuration:nil URL:storeUrl options:nil error:&error]) {
        /*
         Typical reasons for an error here include:
         * The persistent store is not accessible
         * The schema for the persistent store is incompatible with current managed object model
         Check the error message to determine what the actual problem was.
         */

        self.errorHandlerBlock(error, _cmd, YES);
        return nil;
    }

    return _persistentStoreCoordinator;
}

- (void)setIsTestEnvironment:(BOOL)newValue
{
    _isTestEnvironment = newValue;

    if (_isTestEnvironment) {
        self.storeType = NSInMemoryStoreType;
        self.modelBundle = [NSBundle bundleWithIdentifier:@"com.___ORGANIZATIONNAME___.UnitTest"];
    } else {
        self.storeType = nil;
        self.modelBundle = nil;
    }
}

- (NSBundle *)modelBundle;
{
    if (_modelBundle)
        return _modelBundle;
    return [NSBundle mainBundle];
}

- (NSString *)storeType;
{
    if (_storeType)
        return _storeType;
    return NSSQLiteStoreType;
//    return NSInMemoryStoreType;  //InMemory can be used for development/debugging/automated tests
}
@end
