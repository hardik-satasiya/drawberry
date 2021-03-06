//
//  DBToggleButtonCell.m
//  DrawBerry
//
//  Created by Raphael Bost on 09/09/07.
//  Copyright 2007 Raphael Bost. All rights reserved.
//

#import "DBToggleButtonCell.h"


@implementation DBToggleButtonCell
- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{    
//	[super drawWithFrame:cellFrame inView:controlView];
	
	NSImage *backgroundImage, *image;
	NSPoint point;
	NSSize imageSize;
	
 	if([self state] == NSOnState){
		backgroundImage = [NSImage imageNamed:@"button_selected"];
	}else{
		backgroundImage = [NSImage imageNamed:@"button_highlighted"];
//		backgroundImage = nil;
		//[backgroundImage setFlipped:YES];
	}
	
	// rect.origin = NSZeroPoint;
	// rect.size = imageSize;
	// rect = NSInsetRect(rect,1,1);	
	
	imageSize = cellFrame.size;
	imageSize.width -= 4.0;
	imageSize.height -= 4.0;
	
	[backgroundImage setFlipped:YES];
	[backgroundImage setScalesWhenResized:YES];
	[backgroundImage setSize:cellFrame.size];
	
	point = cellFrame.origin;
   
	[backgroundImage drawAtPoint:point fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
	
	[[NSColor colorWithCalibratedRed:.592 green:.592 blue:.592 alpha:1.0] set];
	[NSBezierPath setDefaultLineWidth:0.5];
	[NSBezierPath strokeRect:NSOffsetRect(cellFrame,0.5,0.5)];
	
	image = [self image];
	imageSize = [image size]; 
	
	point.x = floorf(MAX(cellFrame.size.width - imageSize.width, 0)/2.0 + cellFrame.origin.x);
	point.y = floorf(MAX(cellFrame.size.height - imageSize.height, 0)/2.0 + cellFrame.origin.y);	
	
	[image setFlipped:YES];
	[image drawAtPoint:point fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
}

@end
