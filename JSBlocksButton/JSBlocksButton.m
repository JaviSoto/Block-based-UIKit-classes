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

#import "JSBlocksButton.h"

@interface JSBlocksButton()
@property (nonatomic, copy) JSBlocksButtonCallback callback;
@end

@implementation JSBlocksButton

@synthesize callback = _callback;

+ (id)buttonWithType:(UIButtonType)buttonType tapCallback:(JSBlocksButtonCallback)callback
{
    JSBlocksButton *button = [self buttonWithType:buttonType];
	button.callback = callback;
	
    [button addTarget:button action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (id)initWithFrame:(CGRect)frame tapCallback:(JSBlocksButtonCallback)callback
{
    if ((self = [self initWithFrame:frame]))
    {
		self.callback = callback;
        [self addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
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