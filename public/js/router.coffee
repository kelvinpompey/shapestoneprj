define([
  'jquery',
  'underscore',
  'knockout',
  'backbone',
  'cs!views/app', 
  'cs!views/welcome'], ($,_,ko,Backbone, AppView, WelcomeView) ->
    class AppRouter extends Backbone.Router
      routes:
        'taskboard' : 'taskboard'
        '*actions' : 'defaultRoute'

      taskboard: (id) ->
        new AppView

      defaultRoute: -> 
        console.log 'default route'
        new WelcomeView this

      appRouter = new AppRouter
      Backbone.history.start
        pushState: true
        root: '/'


)