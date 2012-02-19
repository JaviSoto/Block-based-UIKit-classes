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

#import "JSBlocksActionSheet.h"

@interface JSBlocksActionSheet ()
@property (nonatomic, copy) JSBlocksActionSheetDismissedCallback callback;
@end

@implementation JSBlocksActionSheet

@synthesize callback = _callback;

- (id)initWithTitle:(NSString *)title dismissedCallback:(JSBlocksActionSheetDismissedCallback)callback cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... 
{
    self = [super initWithTitle:title delegate:self cancelButtonTitle:nil destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    
    if (self)
    {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *buttonTitle = otherButtonTitles; buttonTitle != nil; buttonTitle = va_arg(args, NSString *))
        {
            [self addButtonWithTitle:buttonTitle];
        }
        
        va_end(args);        
        
        if (cancelButtonTitle)
        {
            self.cancelButtonIndex = [self addButtonWithTitle:cancelButtonTitle];
        }
        
		self.callback = callback;
    }
    
    return self;
}

+ (void)showActionSheetInView:(UIView *)view withTitle:(NSString *)title dismissedCallback:(JSBlocksActionSheetDismissedCallback)callback cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... 
{
    JSBlocksActionSheet *actionSheet = [[self alloc] initWithTitle:title dismissedCallback:callback cancelButtonTitle:nil destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
    
    if (actionSheet)
    {
        va_list args;
        va_start(args, otherButtonTitles);
        for (NSString *buttonTitle = otherButtonTitles; buttonTitle != nil; buttonTitle = va_arg(args, NSString *))
        {
            [actionSheet addButtonWithTitle:buttonTitle];
        }
        
        va_end(args);        
        
        if (cancelButtonTitle)
        {
            actionSheet.cancelButtonIndex = [actionSheet addButtonWithTitle:cancelButtonTitle];
        }
        
        [actionSheet showInView:view];
        [actionSheet release];        
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
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