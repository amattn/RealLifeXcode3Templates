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

«OPTIONALHEADERIMPORTLINE»

@interface «FILEBASENAMEASIDENTIFIER» ()

@end

@implementation «FILEBASENAMEASIDENTIFIER»

#pragma mark ** Synthesis **

#pragma mark ** Static Variables **

/*********************************************************************/
#pragma mark -
#pragma mark ** Lifecycle & Memory Management **

- (id)initWithFrame:(CGRect)frame;
{
    if (self = [super initWithFrame:frame])
    {
        // Initialization code
    }
    return self;
}
- (void)dealloc;
{
    [super dealloc];
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Methods **

/*********************************************************************/
#pragma mark -
#pragma mark ** UIView Methods **

- (void)drawRect:(CGRect)rect;
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    {
        CGContextSetGrayFillColor(context, 0.3, 1.0);
        CGContextAddEllipseInRect(context, rect);
        CGContextFillPath(context);
    }
    CGContextRestoreGState(context);
}

/*********************************************************************/
#pragma mark -
#pragma mark ** Accesssors **


@end
