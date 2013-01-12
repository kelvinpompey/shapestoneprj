(define [
  'jquery',
  'jqueryui',
  'underscore',
  'knockout',
  'backbone',
  'cs!models/activityviewmodel',  
  'text!templates/app.html'
  ] (function ($ jqueryui _ ko Backbone ActivityViewModel AppTemplate)

    (var AppView 
      (function () 
        (set ActivityViewModel.instanceCount 0)
        (set this.mainActivity (new ActivityViewModel))
        (var backlog (new ActivityViewModel this.mainActivity))
        (backlog.addTask {title: "HomeWork"})
        (backlog.addTask {title: "Task2"})
        (set backlog.orderFront true)
        (var activity2 (new ActivityViewModel this.mainActivity))
        (this.render)))

    (set AppView.prototype.render 
      (function ()
        (var elem ($ "#container"))
        (elem.append AppTemplate)
        (ko.applyBindings this.mainActivity)
        (set window.ko ko)))
    AppView))
