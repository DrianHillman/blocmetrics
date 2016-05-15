# Blocmetrics
> An API Tracking Service and Reporting Tool

Crafted by Drian Hillman with [Bloc](http://bloc.io)


## Add this snippet to your site or application :chart_with_upwards_trend::

````
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = { name: eventName };
    var request = new XMLHttpRequest();
    
    request.open("POST", "https://blocmetrics-by-drianhillman.herokuapp.com/api/v1/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };
  
  blocmetrics.report("MY EVENT TITLE");
````
<!-- I'll refactor this snippet to a .js url for better usability -->