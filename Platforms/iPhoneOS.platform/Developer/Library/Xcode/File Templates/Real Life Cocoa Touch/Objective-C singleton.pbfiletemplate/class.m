/*********************************************************************
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

//#import "«PROJECTNAME»_Common.h"
«OPTIONALHEADERIMPORTLINE»

@interface «FILEBASENAMEASIDENTIFIER» ()

@end

@implementation «FILEBASENAMEASIDENTIFIER»

#pragma mark ** Synthesis **

#pragma mark ** Static Variables **

static «FILEBASENAMEASIDENTIFIER» *__shared«FILEBASENAMEASIDENTIFIER» = nil;

#pragma mark ** Singleton **


+ («FILEBASENAMEASIDENTIFIER» *)singleton;
{
	@synchronized(self)
	{
		if (__shared«FILEBASENAMEASIDENTIFIER» == nil)
		{
			__shared«FILEBASENAMEASIDENTIFIER» = [[self alloc] init];
		}
	}
	return __shared«FILEBASENAMEASIDENTIFIER»;
}

+ (id)allocWithZone:(NSZone *)zone;
{
	@synchronized(self)
	{
		if (__shared«FILEBASENAMEASIDENTIFIER» == nil)
		{
			__shared«FILEBASENAMEASIDENTIFIER» = [super allocWithZone:zone];
			return __shared«FILEBASENAMEASIDENTIFIER»;
		}
	}
	return nil;
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Lifecyle Methods **

- (id)init;
{
    if (self = [super init])
    {
        
    }
    return self;
}

- (void)dealloc;
{
    [super dealloc];
}

/*********************************************************************/
#pragma mark -
#pragma mark ** NotificationHandlers **

/*********************************************************************/
#pragma mark -
#pragma mark ** Utilities **

/*********************************************************************/
#pragma mark -
#pragma mark ** IBActions **

/*********************************************************************/
#pragma mark -
#pragma mark ** Accesssors **

@end
