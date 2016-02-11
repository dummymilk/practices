FirstApp
===

### Could not launch "FirstApp" (process launch failed : Security)


Solution: 

1. tap the app icon
2. go to Settings --> General --> Profiles
3. Click Trust "username@email.com" then click Trust on the next popup.

--------------

### Can't drag and drop item from storyboard to viewcontroller in xcode

Solution:

1. Select the ViewController in storyboard 
2. change the name of the ViewController to the name in the .h or .m file 
3. try ctrl+click and drag 

----------------
###  UIAlertView is deprecated in iOS 8. (Note that UIAlertViewDelegate is also deprecated.) 

Solution: 

using UIAlertController with a preferredStyle of UIAlertControllerStyleAlert.

> UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                               message:@"This is an alert."
                               preferredStyle:UIAlertControllerStyleAlert];
 
> UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
   handler:^(UIAlertAction * action) {}];
 
>[alert addAction:defaultAction];
>
>[self presentViewController:alert animated:YES completion:nil];

----------------
### NSInvalidArgumentException', reason: '-[ViewController ClickButton:]: unrecognized selector ....

solution:

check whether the button is connecting to one label and one action 

