/******************************************************************************
 *  \file RLCoreDataObjectManager.h
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class RLCoreDataObjectManager
 *  \brief Abtract Base class for the various Core Data Entity Managers
 *  \details
 *
 *  \abstract Abtract Base class for the various Core Data Entity Managers 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.h"

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

@interface RLCoreDataObjectManager : NSObject
{
    NSString *_defaultEntityName;
}

#pragma mark ** CoreDataManager Subclasses may override **
@property(nonatomic, retain, readonly) NSString *defaultEntityName;
@property(nonatomic, retain, readonly) NSArray *defaultSortDescriptors;

#pragma mark ** Core Data Environment Properties & Accessors **
- (NSManagedObjectContext *)managedObjectContextForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
@property(nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

#pragma mark ** Core Data Actions **
- (id)insertNewObjectWithDefaultEntityForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSError *)saveContextForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSError *)deleteObject:(NSManagedObject *)managedObject
     contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

#pragma mark ** Core Data Basic Fetch Actions **
- (NSFetchRequest *)defaultFetchRequestForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSFetchRequest *)fetchRequestForPredicate:(NSPredicate *)predicate
                           contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSUInteger)resultCountForFetchRequest:(NSFetchRequest *)fetchRequest
                       contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllForFetchRequest:(NSFetchRequest *)fetchRequest
                   contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

#pragma mark ** Core Data Custom Fetch Actions **
- (NSUInteger)resultCountForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSUInteger)resultCountWithPredicate:(NSPredicate *)predicate
                     contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
           prefetchedRelationships:(NSArray *)relationshipKeys
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
           prefetchedRelationships:(NSArray *)relationshipKeys
                        fetchLimit:(NSUInteger)fetchLimit
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

- (NSArray *)fetchAllWithSortDescriptors:(NSArray *)sortDescriptors
                       contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
                       
- (id)fetchOneWithPredicate:(NSPredicate *)predicate
          contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

#pragma mark ** UI Objects **

- (void)deleteFetchedResultsControllerCache;
- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier
                                                     sectionNameKeyPath:(NSString *)sectionNameKeyPath
                                                              cacheName:(NSString *)cacheName;
- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier
                                                              cacheName:(NSString *)cacheName;
- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
- (NSFetchedResultsController *)defaultFetchedResultsControllerForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;

#pragma mark ** Utilities **
- (NSEntityDescription *)defaultEntityDescriptionForContextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
+ (NSPredicate *)predicateWithAttributeName:(NSString *)attributeName value:(id)value;

@end
