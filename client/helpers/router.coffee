Meteor.Router.add
	'/': 'incidentsList'
	'/incident/:_id':
		to: 'incidentPage'
		and: (id)->
			Session.set 'currentIncidentId', id

Meteor.Router.filters
	requireLogin: ->
		if Meteor.user()
			return page
		else if Meteor.logginIn()
			return 'loading'
		else
			return 'accessDenied'
	,
	clearErrors: (page) ->
		clearErrors()
		page

Meteor.Router.filter 'requireLogin',
  only: 'incidentNew'

Meteor.Router.filter 'clearErrors'
