/******************************************************************************
 *  \file RLCoreDataObjectManager.m
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class RLCoreDataObjectManager
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract Abtract Base class for the various Core Data Entity Managers 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "RLCoreDataObjectManager.h"

@interface RLCoreDataObjectManager (private_interface)

@end

@implementation RLCoreDataObjectManager
#pragma mark ** Synthesis **

#pragma mark ** Static Variables **

//*****************************************************************************
#pragma mark -
#pragma mark ** CoreDataManager Subclasses may override **

- (NSString *)defaultEntityName;
{
    // Subclasses may override this.

    // This method makes the assumption that your entity name (as defined in 
    // your .xcdatamodel file) is the the same as the name of this class, minus
    // the "Manager" suffix.

    if (_defaultEntityName)
        return _defaultEntityName;
        
    _defaultEntityName = NSStringFromClass([self class]);

    //remove the "Manager"
    NSInteger suffixLength = [@"Manager" length];
    
    _defaultEntityName = [_defaultEntityName stringByReplacingCharactersInRange:NSMakeRange([_defaultEntityName length] - suffixLength, suffixLength)
                                                                     withString:@""];
    
    return [_defaultEntityName retain];
}
- (NSArray *)defaultSortDescriptors;
{
    //Subclasses may override this.
    //Subclasses usually want to add sortDescriptors to the array returned by super
    
    //Example:
    //NSSortDescriptor *sorter = [[[NSSortDescriptor alloc] initWithKey:CD_KEY_TS_ADD ascending:NO] autorelease];
    //return [NSArray arrayWithObject:sorter];
    
    return [NSArray array];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Core Data Primitive Actions **

- (id)insertNewObjectWithDefaultEntityForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    // Create a new instance of the entity managed by the fetched results controller.
    NSManagedObjectContext *context = [self managedObjectContextForContextIdentifier:contextIdentifier];
    NSEntityDescription *entityDescription = [self defaultEntityDescriptionForContextIdentifier:contextIdentifier];
    
    NSManagedObject *newManagedObject = [[[NSManagedObject alloc] initWithEntity:entityDescription
                                                  insertIntoManagedObjectContext:context] autorelease];
    
    // If appropriate, configure the new managed object.
    
    // added timestamp
    //[newManagedObject setValue:[NSDate date] forKey:CD_KEY_TS_ADD];
    // modified timestamp
    //[newManagedObject setValue:[NSDate date] forKey:CD_KEY_TS_MOD];
    
    return newManagedObject;
}

- (NSError *)deleteObject:(NSManagedObject *)managedObject
     contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSManagedObjectContext *context = [self managedObjectContextForContextIdentifier:contextIdentifier];

    [context deleteObject:managedObject];
    return nil;
}

- (NSError *)saveContextForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [[___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment singleton] saveContextForIdentifier:contextIdentifier];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Core Data Basic Fetch Actions **

- (void)handleError:(NSError *)error forFetchRequest:(NSFetchRequest *)fetchRequest;
{
    //Custom error handling here...
    //feel free to log, assert or whatever.
    
    NSLog(@"\nerror:%@\nfetchRequest:%@", error, fetchRequest);
}

- (NSFetchRequest *)defaultFetchRequestForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [self fetchRequestForPredicate:nil
                        contextIdentifier:contextIdentifier];
}
- (NSFetchRequest *)fetchRequestForPredicate:(NSPredicate *)predicate
                           contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity:[self defaultEntityDescriptionForContextIdentifier:contextIdentifier]];
    if (predicate)
        [fetchRequest setPredicate:predicate];
    if (self.defaultSortDescriptors)
        [fetchRequest setSortDescriptors:self.defaultSortDescriptors];
    return fetchRequest;
}
- (NSUInteger)resultCountForFetchRequest:(NSFetchRequest *)fetchRequest
                       contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSManagedObjectContext *context = [self managedObjectContextForContextIdentifier:contextIdentifier];

    NSError *error = nil;
    NSUInteger result = [context countForFetchRequest:fetchRequest error:&error];
    
    if (error)
    {
        [self handleError:error forFetchRequest:fetchRequest];
        return NSNotFound;
    }
    
    return result;
}
- (NSArray *)fetchAllForFetchRequest:(NSFetchRequest *)fetchRequest
                   contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSManagedObjectContext *context = [self managedObjectContextForContextIdentifier:contextIdentifier];
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil || error)
    {
        [self handleError:error forFetchRequest:fetchRequest];
        return nil;
    }
    return fetchedObjects;
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Core Data Custom Fetch Actions **

- (NSUInteger)resultCountForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [self resultCountWithPredicate:nil contextIdentifier:contextIdentifier];
}

- (NSUInteger)resultCountWithPredicate:(NSPredicate *)predicate
                     contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSFetchRequest *fetchRequest = [self fetchRequestForPredicate:predicate contextIdentifier:contextIdentifier];
    return [self resultCountForFetchRequest:fetchRequest
                          contextIdentifier:contextIdentifier];
}

- (NSArray *)fetchAllForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [self fetchAllWithPredicate:nil
                     contextIdentifier:contextIdentifier];
}

- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

{
    return [self fetchAllWithPredicate:predicate
                       sortDescriptors:nil
                     contextIdentifier:contextIdentifier];
}

- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [self fetchAllWithPredicate:predicate
                       sortDescriptors:sortDescriptors
               prefetchedRelationships:nil
                     contextIdentifier:contextIdentifier];
}

- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
           prefetchedRelationships:(NSArray *)relationshipKeys
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [self fetchAllWithPredicate:predicate
                       sortDescriptors:sortDescriptors
               prefetchedRelationships:relationshipKeys
                            fetchLimit:0
                     contextIdentifier:contextIdentifier];
}
- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
           prefetchedRelationships:(NSArray *)relationshipKeys
                        fetchLimit:(NSUInteger)fetchLimit
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSFetchRequest *fetchRequest;
    if (predicate)
        fetchRequest = [self fetchRequestForPredicate:predicate contextIdentifier:contextIdentifier];
    else
        fetchRequest = [self defaultFetchRequestForContextIdentifier:contextIdentifier];
    
    if (sortDescriptors)
        [fetchRequest setSortDescriptors:sortDescriptors];
    if (relationshipKeys)
        [fetchRequest setRelationshipKeyPathsForPrefetching:relationshipKeys];
    if (fetchLimit)
        fetchRequest.fetchLimit = fetchLimit;
    
    return [self fetchAllForFetchRequest:fetchRequest
                       contextIdentifier:contextIdentifier];
}

- (NSArray *)fetchAllWithSortDescriptors:(NSArray *)sortDescriptors
                       contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [self fetchAllWithPredicate:nil
                       sortDescriptors:sortDescriptors
               prefetchedRelationships:nil
                     contextIdentifier:contextIdentifier];
}

- (id)fetchOneWithPredicate:(NSPredicate *)predicate
          contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSFetchRequest *fetchRequest = [self fetchRequestForPredicate:predicate contextIdentifier:contextIdentifier];
    fetchRequest.fetchLimit = 1;
    NSArray *array = [self fetchAllForFetchRequest:fetchRequest
                                 contextIdentifier:contextIdentifier];
    
    if ([array count] == 0)
        return nil;
    return [array objectAtIndex:0];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** UI Objects **

#define CACHE_NAME NSStringFromClass([self class])
- (void)deleteFetchedResultsControllerCache;
{
    [NSFetchedResultsController deleteCacheWithName:CACHE_NAME];
}

- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier
                                                     sectionNameKeyPath:(NSString *)sectionNameKeyPath
                                                              cacheName:(NSString *)cacheName;
{
    NSFetchedResultsController *newFetchedResultsController;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContextForContextIdentifier:contextIdentifier];
    newFetchedResultsController = [[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                       managedObjectContext:managedObjectContext
                                                                         sectionNameKeyPath:sectionNameKeyPath
                                                                                  cacheName:cacheName] autorelease];
    
    return newFetchedResultsController;    
}


- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier
                                                              cacheName:(NSString *)cacheName;
{
    return [self fetchedResultsControllerForFetchRequest:fetchRequest
                                       contextIdentifier:contextIdentifier
                                      sectionNameKeyPath:nil
                                               cacheName:CACHE_NAME];
}

- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [self fetchedResultsControllerForFetchRequest:fetchRequest
                                       contextIdentifier:contextIdentifier
                                               cacheName:CACHE_NAME];
}

- (NSFetchedResultsController *)defaultFetchedResultsControllerForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSFetchRequest *fetchRequest = [self defaultFetchRequestForContextIdentifier:contextIdentifier];
    return [self fetchedResultsControllerForFetchRequest:fetchRequest
                                       contextIdentifier:contextIdentifier];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Utilities **

- (NSEntityDescription *)defaultEntityDescriptionForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSManagedObjectContext *context = [self managedObjectContextForContextIdentifier:contextIdentifier];
    NSManagedObjectModel *managedObjectModel = [[context persistentStoreCoordinator] managedObjectModel];
    NSEntityDescription *entity = [[managedObjectModel entitiesByName] objectForKey:self.defaultEntityName];
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:self.defaultEntityName 
                                                         inManagedObjectContext:context];
    
#ifdef TARGET_IPHONE_SIMULATOR
    NSAssert(entity, @"entityDescription must not be nil %@", self.defaultEntityName);
    NSAssert(entityDescription, @"entityDescription must not be nil");
#endif
    
    return entityDescription;
}

+ (NSPredicate *)predicateWithAttributeName:(NSString *)attributeName value:(id)value;
{
    return [NSPredicate predicateWithFormat:@"%K == %@", attributeName, value];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Core Data Environment Accesssors **

- (NSManagedObjectContext *)managedObjectContextForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    return [[___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment singleton] managedObjectContextForContextIdentifier:contextIdentifier];
}
- (NSManagedObjectModel *)managedObjectModel
{   
    return [___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment singleton].managedObjectModel;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    return [___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment singleton].persistentStoreCoordinator;    
}

@end
