define [
	'jquery', 
	'knockout',
	'cs!models/linkmodel'], 
	($, ko, LinkModel) ->
		class WelcomeViewModel
			constructor: (@router) ->
				console.log "router"
				console.log @router

				titles = [ new LinkModel('Project', '/project'), 
									 new LinkModel('People', '/people'), 
									 new LinkModel('Team Board', '/taskboard'), 
									 new LinkModel('Define Work', '/work/create'),
									 new LinkModel('Calender and Time Off', '/calender'), 
									 new LinkModel('Time Off', '/timeoff'), 
									 new LinkModel('Reports', '/reports'), 
									 new LinkModel('Planning and Estimation', '/planning'), 
									 new LinkModel('Who and What', '/whoandwhat')
									 new LinkModel('Logout', '/logout')]

				@links = ko.observableArray titles
				@itemClicked = (model, event) =>
					console.log model
					@router.navigate model.href, {trigger: true}

