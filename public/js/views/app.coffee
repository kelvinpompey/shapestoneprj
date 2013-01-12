define([
  'jquery',
  'jqueryui',
  'underscore',
  'knockout',
  'backbone'
  'cs!models/activityviewmodel',
  'text!templates/app.html',
  'text!templates/taskdetail.html',
  'text!templates/layout.html'
  ], ($,jqueryui,_,ko, Backbone, ActivityViewModel, AppTemplate, TaskDetailTemplate, LayoutTemplate) ->

  class AppView
    constructor: ->
      console.log "instantiating appview"
      ActivityViewModel.instanceCount = 0

      this.mainActivity = new ActivityViewModel
      backlog = new ActivityViewModel(@mainActivity)
      backlog.addTask
        title: 'Home Work'
      backlog.addTask
        title: 'Task 2'
      backlog.orderFront = true
      new ActivityViewModel(@mainActivity)
      @render()

    render: ->
      $("body").html LayoutTemplate
      $("#container").append AppTemplate
      $("#taskDetail").append TaskDetailTemplate
      ko.applyBindings @mainActivity
      window.ko = ko
      window.mainActivity = @mainActivity
	  





)



