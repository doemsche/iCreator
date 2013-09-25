Meteor.Router.add
	'/': 'incidentsList'

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
