define([
  'jquery',
  'underscore',
  'knockout'], ($,_,ko) ->
    class TaskModel
      constructor: ->
        @title = ko.observable 'Task'
        @activity = null        
      taskClicked: (model) ->
      	console.log "task taskClicked"
      	console.log model
      	this.activity.selectedTask(model)
      titleChanged: (model, event) =>
      	@title $(event.target).text()



)