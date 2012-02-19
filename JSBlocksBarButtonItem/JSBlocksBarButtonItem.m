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

#import "JSBlocksBarButtonItem.h"

@interface JSBlocksBarButtonItem()
@property (nonatomic, copy) JSBlocksBarButtonItemCallback callback;
@end

@implementation JSBlocksBarButtonItem

@synthesize callback = _callback;

- (id)initWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style tapCallback:(JSBlocksBarButtonItemCallback)callback
{
    if ((self = [super initWithTitle:title style:style target:self action:@selector(buttonTapped)]))
    {
		self.callback = callback;
    }
    
    return self;
}

- (id)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem tapCallback:(JSBlocksBarButtonItemCallback)_callback
{
    if ((self = [super initWithBarButtonSystemItem:systemItem target:self action:@selector(buttonTapped)]))
    {
		self.callback = callback;
    }
    
    return self;
}
         
- (void)buttonTapped
{
    if (self.callback)
    {
        self.callback(self);
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
