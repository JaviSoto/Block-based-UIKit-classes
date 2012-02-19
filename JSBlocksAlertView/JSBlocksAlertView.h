/* 
 Copyright 2012 Javier Soto (ios@javisoto.es)
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License. 
 */

#import <UIKit/UIKit.h>

@class JSBlocksAlertView;

typedef void (^JSBlocksAlertViewDismissedCallback)(JSBlocksAlertView *alertView, int buttonIndex);

@interface JSBlocksAlertView : UIAlertView <UIAlertViewDelegate>

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  dismissedCallback:(JSBlocksAlertViewDismissedCallback)callback
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ...
NS_REQUIRES_NIL_TERMINATION;

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
             dismissedCallback:(JSBlocksAlertViewDismissedCallback)callback
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSString *)otherButtonTitles, ...
NS_REQUIRES_NIL_TERMINATION;

@end
