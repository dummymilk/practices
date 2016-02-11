Handle Row Selection in UITableView
===

###delegate 
>is responsible for `a specific role` or `task` to keep the system simple and clean

###UITableViewDataSource delegate
>used for displaying table data. 

###UITableViewDelegate 
>deals with the appearance of the UITableView, as well as, handles the row selection.


###willSelectRowAtIndexPath
> is called when a specified row is about to be selected. Usually you make use of this method to `prevent selection of a particular cell` from taking place. 

###didSelectRowAtIndexPath
> invoked after user selects a row, to handle the row selection and this is where you add code to specify the action when the row is selected.

### UIAlertView (deprecated in iOS8)

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Row Selected" message:@"You've selected a row" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];

###  display a check mark when a row is selected
add two lines of code after alertController

>     UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

>> The first line retrieves the selected table cell by using the indexPath.
> 
    cell.accessoryType = UITableViewCellAccessoryCheckmark; 
>> The second link updates the accessory view of the cell with a check mark.
    
### row will be highlighted in blue color
disable it 
> [tableView deselectRowAtIndexPath:indexPath animated:YES];
