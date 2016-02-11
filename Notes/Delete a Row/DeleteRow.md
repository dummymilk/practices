Delete a Row 
===

###Model-View-Controller
>
> + Model 
> 	- holding the data or any operations on the data
>	- an array object that stores all the table data
>	- Add, edit and delete are examples of the operations
>
> + View 
> 	- view manages the visual display of information
>		* e.g: UITableView shows information in a table view format.
>
> + Controller 
> 	- a bridge between model and view
>	- translates the user interaction from the view into appropriate action to be performed in the model

### Step for deleting a row

> 1. Write code to switch to edit mode for row deletion
> 2. Delete the corresponding table data from the model
> 3. Reload the table view