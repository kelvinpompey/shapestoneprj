define([
  'jquery',
  'jqueryui'
  'underscore',
  'knockout'
  'cs!models/taskmodel'], ($,jqueryui,_,ko, TaskModel) ->
  ActivityViewModel = (@parent) ->
    console.log "@parent"
    console.log @parent.subActivities().length if !_.isUndefined(@parent)
    ActivityViewModel.instanceCount++;
    @subActivities = ko.observableArray()
    @tasks = ko.observableArray()
    @title = ko.observable "Activity #{ActivityViewModel.instanceCount}"
    task = new TaskModel 
    task.title('default')
    @selectedTask = ko.observable(task)
    @editMode = ko.observable false
    @orderFront = false
    @displayTasks = ko.computed => (@subActivities().length == 0)

    @siblingWidth = ko.computed =>
      if _.isUndefined(@parent) then return 0
      index  = @parent.subActivities.indexOf this

      if index == -1 then index = @parent.subActivities().length
      if index == 0 then return 0

      sib = @parent.subActivities()[index - 1]
      console.log "index #{index} sib #{sib}"
      return sib.rect.left() + sib.rect.width()




    @childrenWidth = ko.computed =>
      last = _.last(@subActivities())
      if last then last.rect.left() + last.rect.width() else 200


    @rect =
      top: ko.observable 20
      left: @siblingWidth
      width: @childrenWidth
      height: ko.observable 200

    @style = ko.computed =>
      values = [
        "position: absolute",
        "top: #{@rect.top()}px",
        "left: #{@rect.left()}px",
        "width: #{@rect.width()}px",
        "height: #{@rect.height()}px",]
      values.push "z-index: 10000" if @orderFront
      values.join ";"

    @addItem = (model) =>
      console.log ko.toJS(this)
      newActivity = new ActivityViewModel(model)
      console.log(@style())

    @titleChanged = (model, event) =>
      @title $(event.target).text()      

    @startItemEdit = (model) =>
      @editMode true
      console.log model

    @endItemEdit = (model) =>
      @editMode false

    @styleChange = (value) =>
      #console.log "style change: #{value}"

    @addTask = (params) =>
      task = new TaskModel
      task.title(params.title) if params
      task.activity = this
      @tasks.push task

    console.log @style()

    @dragStart = (event, ui) ->
      console.log "start dragging"

    @onDrop = (event, ui) ->
      event.preventDefault()
      model = ko.dataFor this
      console.log "dropped at #{ko.dataFor(this).title()}"
      task = ko.dataFor event.srcElement
      $(event.srcElement).hide()
      console.log task

      task.activity.subActivities.remove task
      task.activity = model
      model.tasks.push task

      $(this).removeClass 'highlight' unless _.isUndefined(model.parent)


    @onOver = (event, ui) ->
      model = ko.dataFor this
      $(this).addClass 'highlight' unless _.isUndefined(model.parent)

    @onOut = (event, ui) ->
      model = ko.dataFor this
      $(this).removeClass 'highlight' unless _.isUndefined(model.parent)

    @parent.subActivities.push(this) unless !@parent

    ko.bindingHandlers.draggable =
      init: (element, valueAccessor, allBindingsAccessor, model) ->
        options = ko.utils.unwrapObservable valueAccessor()
        $(element).draggable options

    ko.bindingHandlers.droppable =
      init: (element, valueAccessor, allBindingsAccessor, model) ->
        console.log "droppable"
        options = ko.utils.unwrapObservable valueAccessor()
        console.log options
        $(element).droppable options

    # The activity/taskdetail section is bound to the selectedtask 
    # attribute of the root activity so when the selectedtask of
    # a child activity is changed the selected task of the parent
    # activity has to be changed also so that eventually the selected 
    # task of the root activity is changed! 

    this.selectedTask.subscribe (newValue) =>
      console.log "new value: "
      console.log newValue
      @parent.selectedTask(newValue) if @parent




    this
)