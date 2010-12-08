/*********************************************************************
 *  \file ProjectTestCase.m
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class ProjectTestCase
 *  \brief Part of ___PROJECTNAME___
 *  \details
 *
 *  \abstract CLASS_ABSTRACT
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

@interface ProjectTestCase : SenTestCase
{

}
@end

@implementation ProjectTestCase

- (void)setUp;
{
    NSLog(@"Open Console.app to see log messages");
}

- (void)tearDown;
{
    
}

- (void)testTestFramework;
{
    NSString *string1 = @"test";
    NSString *string2 = @"test";
    // Shouldn't use colons (:) in the STAssert... function messages.
    // Xcode will strip out everything before the colon.
    STAssertEqualObjects(string1, string2, @"FAILURE- %@ does not equal %@ ", string1, string2);

    NSUInteger uint_1 = 4;
    NSUInteger uint_2 = 4;
    STAssertEquals(uint_1, uint_2, @"FAILURE- %d does not equal %d", uint_1, uint_2);
}

@end
