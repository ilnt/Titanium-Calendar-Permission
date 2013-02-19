Calendar Permission Module for iOS 6.0
======================================

It gets calendar permission to support iOS 6.0 privacy settings.

Usage
-----

```js
var calendar_permission = require('com.ti.calendar.permission');

calendar_permission.authorization({
	success: function () {
		/* success event */
		Ti.API.info("Success.");
	},
	failure: function () {
		/* failure event */
		Ti.API.info("Failure.");
	}
});
```

License
-------

The MIT License

Copyright
---------

Copyright (c) 2013 infiniteloop Co., Ltd.