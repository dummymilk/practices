Simple Table View
======

####UITableView
> handle various types of data 

####UITableViewDataSource
> tell UITableView the list of data to display

####NSArray 
> create static array for which the size is fixed


####NSMutableArray instead.
> dynamic array
 
####UITableViewDataSource protocol
1. “tableView:numberOfRowsInSection” 
2. “tableView:cellForRowAtIndexPath” 

#### Display the data on table view
1. Ctrl + right click 
2. connect `dataSource` and `delegate` to UIViewController

#### display cells with diff. image

create NSArray
> tableImage =[NSArray arrayWithObjects:[UIImage imageNamed:@"milk.jpg"],
                 [UIImage imageNamed:@"keith.jpg"],[UIImage imageNamed:@"david.jpg"],[UIImage imageNamed:@"sam.jpg"],nil];
display diff. image 
> cell.imageView.image = [tableImage objectAtIndex:indexPath.row];

#### “Could not find Developer Disk Image”
> check deployment target version and iphone version 
