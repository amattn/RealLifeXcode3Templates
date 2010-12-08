/*********************************************************************
 *  \file ___PROJECTNAMEASIDENTIFIER___AppDelegate.m
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class RootViewController
 *  \brief Part of ___PROJECTNAME___
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "___PROJECTNAMEASIDENTIFIER___AppDelegate.h"
#import "___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.h"
#import "RootViewController.h"

@implementation ___PROJECTNAMEASIDENTIFIER___AppDelegate

@synthesize window = window_;
@synthesize navigationController = navigationController_;

/*********************************************************************/
#pragma mark -
#pragma mark ** Memory management **

- (void)dealloc;
{
    self.navigationController = nil;
    self.window = nil;
    [super dealloc];
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Utilities **

- (void)saveState;
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment singleton] saveContextForIdentifier:___PROJECTNAMEASIDENTIFIER___MainThreadContext];
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Application Lifecycle **

- (void)applicationDidFinishLaunching:(UIApplication *)application;
{
    // Override point for customization after app launch    
    
    [self.window addSubview:[self.navigationController view]];
    [self.window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application;
{
    [self saveState];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveState];
}

@end