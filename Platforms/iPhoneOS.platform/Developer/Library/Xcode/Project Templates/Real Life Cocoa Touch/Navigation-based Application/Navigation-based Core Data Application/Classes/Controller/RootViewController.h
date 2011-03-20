/******************************************************************************
 *  \file RootViewController.h
 *  \author ___FULLUSERNAME___
 *  \date ___DATE___
 *  \class RootViewController
 *  \brief CLASS_BRIEF
 *  \details
 *
 *  \abstract CLASS_ABSTRACT 
 *  \copyright Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#pragma mark ** Constant Defines **

#pragma mark ** Protocols & Declarations **

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
    NSFetchedResultsController *_fetchedResultsController;  ///< Efficiently fetch from CoreData to populate UITableView
}

#pragma mark ** Properties **
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

#pragma mark ** Methods **

@end
