/******************************************************************************
 *  \file «FILENAME»
 *  \author «FULLUSERNAME»
 *  \date «DATE»
 *  \class «FILEBASENAMEASIDENTIFIER»
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright «ORGANIZATIONNAME» «YEAR». All rights reserved.
 */

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

@interface «FILEBASENAMEASIDENTIFIER» : SenTestCase
{

}
@end

@implementation «FILEBASENAMEASIDENTIFIER»

- (void)setUp;
{
    NSLog(@"Open Console.app to see log messages");
}

- (void)tearDown;
{
    
}

- (void)testTestFramework;
{
//    STFail(@"uncomment to verify unit tests are being run");

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
