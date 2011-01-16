/******************************************************************************
 *  \file ___PROJECTNAMEASIDENTIFIER___AppDelegate.h
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class ___PROJECTNAMEASIDENTIFIER___AppDelegate
 *  \brief Part of ___PROJECTNAME___
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import <UIKit/UIKit.h>

@class ___PROJECTNAMEASIDENTIFIER___ViewController;

@interface ___PROJECTNAMEASIDENTIFIER___AppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    ___PROJECTNAMEASIDENTIFIER___ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ___PROJECTNAMEASIDENTIFIER___ViewController *viewController;

@end

