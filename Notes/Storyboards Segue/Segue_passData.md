Storyboards Segue:Pass Data Between View Controllers
===

###Segues 
> + manages the transition between view controllers
> + prepare for the transition from one view controller to another

### segue.destinationViewController
> ####retrieve the destination controller

###  NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
>  invokes the tableView:indexPathForSelectedRow to retrieve the selected table row 

### FAIL >> the detail view should display the name of the selected item...
> solution: connect the tableview variable to storyboard!!!
> Orz