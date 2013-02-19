/**
 * Copyright (c) 2013 infiniteloop Co., Ltd.
 * 
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComTiCalendarPermissionModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <EventKit/EventKit.h>

@implementation ComTiCalendarPermissionModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"c361c2bf-ff9d-425d-a814-42634ebc891b";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.ti.calendar.permission";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)authorization:(id)args
{
	ENSURE_UI_THREAD_1_ARG(args);
	ENSURE_SINGLE_ARG(args, NSDictionary);
	id success = [args objectForKey:@"success"];
	id failure = [args objectForKey:@"failure"];
	RELEASE_TO_NIL(successCallback);
	RELEASE_TO_NIL(failureCallback);
	successCallback = [success retain];
	failureCallback = [failure retain];
	
	EKEventStore *eventStore = [[[EKEventStore alloc] init] autorelease];
	
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL(@"6.0"))
		[eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
			if (granted)
				[self _fireEventToListener:@"success" withObject:nil listener:successCallback thisObject:nil];
			else if (failureCallback != nil)
				[self _fireEventToListener:@"failure" withObject:nil listener:failureCallback thisObject:nil];
		}];
	else
		[self _fireEventToListener:@"success" withObject:nil listener:successCallback thisObject:nil];
}

@end
