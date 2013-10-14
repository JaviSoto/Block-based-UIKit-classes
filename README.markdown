#Description:
Subclasses of frequently used UIKit classes to be able to use them by passing a callback block instead of having to implement the delegate method for more readable code.
You also have some + show methods to be able to achieve the whole functionality in just one call.

#Included classes:
+ JSBlocksActionSheet
+ JSBlocksAlertView
+ JSBlocksBarButtonItem
+ JSBlocksButton

#Sample usage:
```objective-c
#import "JSBlocksAlertView.h"
[JSBlocksAlertView showAlertViewWithTitle:@"title" message:@"message" dismissedCallback:^(JSBlocksAlertView *alertView, int buttonIndex) {
	// callback logic
} cancelButtonTitle:@"cancel" otherButtonTitles: nil];
```

For the rest, refer to the .h files

#License
Copyright 2012 Javier Soto (ios@javisoto.es)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/JaviSoto/block-based-uikit-classes/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

