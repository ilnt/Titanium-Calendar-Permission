/**
 * Copyright (c) 2013 infiniteloop Co., Ltd.
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface ComTiCalendarPermissionModule : TiModule 
{
  KrollCallback *successCallback;
  KrollCallback *failureCallback;
}

@end
