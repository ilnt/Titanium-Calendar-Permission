// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel({
  text: "Calendar Permission Module"
});
win.add(label);
win.open();

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
