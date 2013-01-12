define ['jquery', 'knockout', 'cs!models/welcomeviewmodel', 'text!templates/welcome.html'], ($, ko, WelcomeViewModel, WelcomeTemplate) ->
	class WelcomeView
		constructor: (@router) -> 
			console.log "instantiating welcomeview"
			@render()
		render: ->
			$("body").html WelcomeTemplate 
			ko.applyBindings(new WelcomeViewModel(@router))

