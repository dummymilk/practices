Tab Bar Controller and UIWebView
===

###Tab Bar Controller
> 1. select the “Navigation Controller” in MainStoryboard.storyboard 
> 2. select “Editor” in the menu 
> 3. choose “Embed in”
> 4. chose “Tab Bar Controller”.

### establish a relationship between the new navigation controller and the existing tab bar controller
> 1. Press and hold the “control” key
> 2. click the `Tab Bar Controller` 
> 3. drag the pointer to the new `Navigation Controller`

### Question on day 11
> why do we need to setup two variables on detailViewController.h and assign them to same value on detailViewController.m?
> 	
	@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
	@property (nonatomic, strong) NSString *name;
    nameLabel.text = name;
> why don't we use nameLabel directly on SimpleTableViewController.m?
> 	
	        NSIndexPath *indexPath = [self.tableCellView indexPathForSelectedRow];
        detailViewController *destViewController = segue.destinationViewController;
        destViewController.name = [teammateArray objectAtIndex:indexPath.row];
>
> UI______ only can assign value after viewDidLoad!
> when passing variable through segue , viewDidLoad didn't happen!!
> So we need to save the variable in NS_____ first.
> when viewDidLoad happen, assign the value to UI______.
>  