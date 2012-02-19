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

#import "JSBlocksAlertView.h"

@interface JSBlocksAlertView()
@property (nonatomic, copy) JSBlocksAlertViewDismissedCallback callback;
@end

@implementation JSBlocksAlertView

@synthesize callback = _callback;

- (id)initWithTitle:(NSString *)title message:(NSString *)message dismissedCallback:(JSBlocksAlertViewDismissedCallback)callback cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    if (self)
    {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *buttonTitle = otherButtonTitles; buttonTitle != nil; buttonTitle = va_arg(args, NSString *))
        {
            [self addButtonWithTitle:buttonTitle];
        }
        va_end(args);        
        
		self.callback = callback;
    }
    
    return self;
}

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message dismissedCallback:(JSBlocksAlertViewDismissedCallback)callback cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
	JSBlocksAlertView *alertView = [[self alloc] initWithTitle:title message:message dismissedCallback:callback cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    if (alertView)
    {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *buttonTitle = otherButtonTitles; buttonTitle != nil; buttonTitle = va_arg(args, NSString *))
        {
            [alertView addButtonWithTitle:buttonTitle];
        }
        va_end(args);
    }
    
    [alertView show];
	[alertView release];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if (self.callback)
	{
    	self.callback(self, buttonIndex);
	}
}

- (void)dealloc
{
	if (_callback)
	{
    	[_callback release];
	}
    
    [super dealloc];
}

@end
