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

//#import "«PROJECTNAME»_GlobalUtilities.h"
«OPTIONALHEADERIMPORTLINE»

@interface «FILEBASENAMEASIDENTIFIER» ()

@end

@implementation «FILEBASENAMEASIDENTIFIER»

#pragma mark ** Synthesis **

#pragma mark ** Static Variables **

/*********************************************************************/
#pragma mark -
#pragma mark ** Lifecycle & Memory Management **

/*
- (id)initWithStyle:(UITableViewStyle)style;
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style])
    {

    }
    return self;
}
*/
- (void)dealloc;
{
    [super dealloc];
}
/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
*/

/*********************************************************************/
#pragma mark -
#pragma mark ** UIView Methods **

- (void)viewDidLoad;
{
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload;
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

/*
- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated;
{
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated;
{
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES; //support all orienetations
}
*/

/*********************************************************************/
#pragma mark -
#pragma mark ** UITableViewController Methods **

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Set up the cell...

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;
{
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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