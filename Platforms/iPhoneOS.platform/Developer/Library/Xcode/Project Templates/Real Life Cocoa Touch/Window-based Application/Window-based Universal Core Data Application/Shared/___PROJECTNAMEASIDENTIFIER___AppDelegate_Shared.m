/******************************************************************************
 *  \file ___PROJECTNAMEASIDENTIFIER___AppDelegate_Shared.h
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class ___PROJECTNAMEASIDENTIFIER___AppDelegate_Shared
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "___PROJECTNAMEASIDENTIFIER___AppDelegate_Shared.h"
//#import "___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment.h"

@implementation ___PROJECTNAMEASIDENTIFIER___AppDelegate_Shared

#pragma mark ** Synthesis **

@synthesize window = _window;

//*****************************************************************************
#pragma mark -
#pragma mark ** Memory Management **

- (void)dealloc;
{
    self.window = nil;
    [super dealloc];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    // Free up as much memory as possible by purging cached data objects 
    // that can be recreated (or reloaded from disk) later.
}


//*****************************************************************************
#pragma mark -
#pragma mark ** Utilities **

- (void)saveState;
{
    [[NSUserDefaults standardUserDefaults] synchronize];
//    [[___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment singleton] saveContextForIdentifier:___PROJECTNAMEASIDENTIFIER___CoreDataEnvironment];
}

//*****************************************************************************
#pragma mark -
#pragma mark ** Application Lifecycle **

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    // Override point for customization after app launch. 
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