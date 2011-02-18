/******************************************************************************
 *  \file «FILENAME»
 *  \author «FULLUSERNAME»
 *  \date «DATE»
 *  \class «FILEBASENAMEASIDENTIFIER»
 *  \brief Part of «PROJECTNAME»
 *  \details
 *
 *  \abstract NSManagedObject subclass.  Encapsulated functionality specific to 
 *            a given Core Data Entity. 
 *  \copyright Copyright «ORGANIZATIONNAME» «YEAR». All rights reserved.
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

//#import "MacroUtilities.h"
«OPTIONALHEADERIMPORTLINE»

@implementation «FILEBASENAMEASIDENTIFIER»

#pragma mark ** Synthesis **

//@dynamic attributeName;

//*****************************************************************************
#pragma mark -
#pragma mark ** Lifecyle **

- (void)awakeFromFetch;
{
    [super awakeFromFetch];
    // Custom behavior should occur AFTER[ [super awakeFromFetch].
    
    // You should not modify relationships in this method as the inverse will not be set.
    // See deocumentation for details.
}

- (void)awakeFromInsert;
{
    [super awakeFromInsert];
    // Custom behavior should occur AFTER [super awakeFromInsert].
}

- (void)didTurnIntoFault;
{
    // Release any unnecessary or transient resources here.
    // Should not fetch or save or otherwise affect the Managed Object Context in this method.

    [super didTurnIntoFault];
}


//*****************************************************************************
#pragma mark -
#pragma mark ** Methods **

//*****************************************************************************
#pragma mark -
#pragma mark ** Utilities **

//*****************************************************************************
#pragma mark -
#pragma mark ** Accesssors **

@end
