/******************************************************************************
 *  \file ___PROJECTNAMEASIDENTIFIER___AppDelegate.m
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class RootViewController
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "___PROJECTNAMEASIDENTIFIER___AppDelegate.h"
#import "___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.h"
#import "RootViewController.h"

@implementation ___PROJECTNAMEASIDENTIFIER___AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

//*****************************************************************************
#pragma mark -
#pragma mark ** Memory management **

- (void)dealloc;
{
    self.navigationController = nil;
    self.window = nil;
    [super dealloc];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Utilities **

- (void)saveState;
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment singleton] saveContextForIdentifier:___PROJECTNAMEASIDENTIFIER___MainThreadContext];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Application Lifecycle **

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    // Override point for customization after app launch. 
    
    [self.window addSubview:[self.navigationController view]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. 
    // This can occur for certain types of temporary interruptions (such as an
    // incoming phone call or SMS message) or when the user quits the 
    // application and it begins the transition to the background state.
    //
    // Use this method to pause ongoing tasks, disable timers, and throttle 
    // down OpenGL ES frame rates. Games should use this method to pause the game.

    [self saveState];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the 
    // application was inactive. If the application was previously in the 
    // background, optionally refresh the user interface.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Sent when the application is put in the background
    // This typically means that a user has switched away from this
    // app to bring another app to the foreground.
    // This method should complete within approximately 5 seconds
    // or the system may force the app into suspended mode or 
    // simply terminate the app
    
    // Unless you are running background tasks, 
    // applicationWillResignActive: is the typical method where
    // cleanup tasks are performed.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // This method should complete within approximately 5 seconds
    // or the system may forcefully terminate the app
    [self saveState];
}

@end
