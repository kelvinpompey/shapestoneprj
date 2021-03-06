// Generated by CoffeeScript 1.4.0
(function() {

  define(['jquery', 'knockout'], function($, ko) {
    var WelcomeViewModel;
    return WelcomeViewModel = (function() {

      function WelcomeViewModel() {
        var titles;
        titles = ['Project', 'People', 'Team Board', 'Define Work', 'Calender and Time Off', 'Reports', 'Planning and Estimation', 'Who and What', 'Planning and Estimation', 'Logout'];
        this.links = ko.observableArray(titles);
        this.itemClicked = function(model, event) {
          return console.log(model);
        };
      }

      return WelcomeViewModel;

    })();
  });

}).call(this);
