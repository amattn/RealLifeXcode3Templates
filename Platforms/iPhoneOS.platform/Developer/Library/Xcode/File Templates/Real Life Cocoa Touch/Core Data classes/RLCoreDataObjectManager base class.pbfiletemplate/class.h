/******************************************************************************
 *  \file RLCoreDataObjectManager.h
 *  \author «FULLUSERNAME»
 *  \date «DATE»
 *  \class «FILEBASENAMEASIDENTIFIER»
 *  \brief Abtract Base class for the various Core Data Entity Managers
 *  \details
 *
 *  \abstract Abtract Base class for the various Core Data Entity Managers 
 *  \copyright Copyright «ORGANIZATIONNAME» «YEAR». All rights reserved.
 */

#import "RLCoreDataEnvironment.h"

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

@interface «FILEBASENAMEASIDENTIFIER» : NSObject
{
    NSString *_defaultEntityName;
}

#pragma mark ** CoreDataManager Subclasses may override **
@property(nonatomic, retain, readonly) NSString *defaultEntityName;
@property(nonatomic, retain, readonly) NSArray *defaultSortDescriptors;

#pragma mark ** Core Data Environment Properties & Accessors **
- (NSManagedObjectContext *)managedObjectContextForContextIdentifier:(RLContextIdentifier)contextIdentifier;
@property(nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

#pragma mark ** Core Data Actions **
- (id)insertNewObjectWithDefaultEntityForContextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSError *)saveContextForContextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSError *)deleteObject:(NSManagedObject *)managedObject
     contextIdentifier:(RLContextIdentifier)contextIdentifier;

#pragma mark ** Core Data Basic Fetch Actions **
- (NSFetchRequest *)defaultFetchRequestForContextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSFetchRequest *)fetchRequestForPredicate:(NSPredicate *)predicate
                           contextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSUInteger)resultCountForFetchRequest:(NSFetchRequest *)fetchRequest
                       contextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllForFetchRequest:(NSFetchRequest *)fetchRequest
                   contextIdentifier:(RLContextIdentifier)contextIdentifier;

#pragma mark ** Core Data Custom Fetch Actions **
- (NSUInteger)resultCountForContextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSUInteger)resultCountWithPredicate:(NSPredicate *)predicate
                     contextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllForContextIdentifier:(RLContextIdentifier)contextIdentifier;

- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                 contextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
                 contextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
           prefetchedRelationships:(NSArray *)relationshipKeys
                 contextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
           prefetchedRelationships:(NSArray *)relationshipKeys
                        fetchLimit:(NSUInteger)fetchLimit
                 contextIdentifier:(RLContextIdentifier)contextIdentifier;

- (NSArray *)fetchAllWithSortDescriptors:(NSArray *)sortDescriptors
                       contextIdentifier:(RLContextIdentifier)contextIdentifier;
                       
- (id)fetchOneWithPredicate:(NSPredicate *)predicate
          contextIdentifier:(RLContextIdentifier)contextIdentifier;

#pragma mark ** UI Objects **

- (void)deleteFetchedResultsControllerCache;
- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(SSContextIdentifier)contextIdentifier
                                                     sectionNameKeyPath:(NSString *)sectionNameKeyPath
                                                              cacheName:(NSString *)cacheName;
- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(RLContextIdentifier)contextIdentifier
                                                              cacheName:(NSString *)cacheName;
- (NSFetchedResultsController *)fetchedResultsControllerForFetchRequest:(NSFetchRequest *)fetchRequest
                                                      contextIdentifier:(RLContextIdentifier)contextIdentifier;
- (NSFetchedResultsController *)defaultFetchedResultsControllerForContextIdentifier:(RLContextIdentifier)contextIdentifier;

#pragma mark ** Utilities **
- (NSEntityDescription *)defaultEntityDescriptionForContextIdentifier:(RLContextIdentifier)contextIdentifier;
+ (NSPredicate *)predicateWithAttributeName:(NSString *)attributeName value:(id)value;

@end
