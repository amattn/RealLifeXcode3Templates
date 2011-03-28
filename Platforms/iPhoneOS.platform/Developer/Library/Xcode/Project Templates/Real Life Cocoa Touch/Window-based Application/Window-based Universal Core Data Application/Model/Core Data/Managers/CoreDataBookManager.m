/******************************************************************************
 *  \file CoreDataBookManager.m
 *  \author ___FULLUSERNAME___
 *  \date 2011/3/21
 *  \class CoreDataBookManager
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

/*
 * Methods you Must Not Override
 * NSManagedObject itself customizes many features of NSObject so that 
 * managed objects can be properly integrated into the Core Data 
 * infrastructure. Core Data relies on NSManagedObject’s implementation 
 * of the following methods, which you therefore absolutely must not 
 * override: primitiveValueForKey:, setPrimitiveValue:forKey:, isEqual:, 
 * hash, superclass, class, self, zone, isProxy, isKindOfClass:, 
 * isMemberOfClass:, conformsToProtocol:, respondsToSelector:, retain, 
 * release, autorelease, retainCount, managedObjectContext, entity, 
 * objectID, isInserted, isUpdated, isDeleted, and isFault.
 *
 * In addition to the methods listed above, on Mac OS X v10.5, you must
 * not override: alloc, allocWithZone:, new, instancesRespondToSelector:,
 * instanceMethodForSelector:, methodForSelector:, 
 * methodSignatureForSelector:, instanceMethodSignatureForSelector:, 
 * or isSubclassOfClass:.
 *
 * As with any class, you are strongly discouraged from overriding the 
 * key-value observing methods such as willChangeValueForKey: and 
 * didChangeValueForKey:withSetMutation:usingObjects:.
 * 
 * You are discouraged from overriding description—if this method 
 * fires a fault during a debugging operation, the results may be 
 * unpredictable. You are also discouraged from overriding 
 * initWithEntity:insertIntoManagedObjectContext:, dealloc, or finalize. 
 */

#import "CoreDataBookManager.h"


@implementation CoreDataBookManager

#pragma mark ** Synthesis **

//@dynamic attributeName;

#pragma mark ** Static Variables **

static CoreDataBookManager *__sharedCoreDataBookManager = nil;

#pragma mark ** Singleton **

+ (CoreDataBookManager *)singleton;
{
    @synchronized(self)
    {
        if (__sharedCoreDataBookManager == nil)
        {
            __sharedCoreDataBookManager = [[self alloc] init];
        }
    }
    return __sharedCoreDataBookManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (__sharedCoreDataBookManager == nil)
        {
            __sharedCoreDataBookManager = [super allocWithZone:zone];
            return __sharedCoreDataBookManager;
        }
    }
    return nil;
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Lifecyle & Memory Management **

- (id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

- (void)dealloc
{
    
    [super dealloc];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** CoreDataManager Subclasses may override **

- (NSArray *)defaultSortDescriptors;
{
    // Here is an example of how to add a custom sort descriptor in addition to the default sort descriptors.
    //
    // NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:CD_KEY_TS_ADD ascending:NO];
    // NSArray *scanRecordSortDescriptors = [NSArray arrayWithObject:sorter];
    // return [scanRecordSortDescriptors arrayByAddingObjectsFromArray:super.defaultSortDescriptors];

    return super.defaultSortDescriptors;
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Actions **

- (NSArray *)fetchAllBooksByAuthor:(CoreDataAuthor *)someAuthor
                 contextIdentifier:(___PROJECTNAMEASIDENTIFIER___CoreDataEnvironmentContextIdentifier)contextIdentifier;
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", CD_KEY_AUTHOR, someAuthor];
    return [self fetchOneWithPredicate:predicate contextIdentifier:contextIdentifier];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Accesssors **

@end