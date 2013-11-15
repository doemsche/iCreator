Meteor.Router.add
	#static pagges
	'/':
		to: 'incidentsList'
		and: ->
			Session.set 'currentPage', 'home'

	'/about/':
		to: 'aboutPage'
		and: ->
			Session.set 'currentPage', 'about'

	'/incident/:_id':
		to: 'incidentDetailPage'
		and: (id)->
			Session.set 'currentIncidentId', id
			Session.set 'currentPage', 'none'

	'/incident/:_id/edit':
		to: 'incidentEdit'
		and: (id) ->
			Session.set 'currentIncidentId', id
			Session.set 'currentPage', 'none'

	'/userprofile/:_id':
		to: 'userProfile'
		and: (id) ->
			Meteor.userId()
			Session.set 'currentPage', 'profile'

	'/userprofile/:_id/edit':
		to: 'userProfileEdit'
		and: (id) ->
			Meteor.userId()
			Session.set 'currentPage', 'profile'

Meteor.Router.filters
	requireLogin: ->
		if Meteor.user()
			return page
		else if Meteor.logginIn()
			return 'loading'
		else
			return 'accessDenied'
	,
	clearErrors2: (page) =>
		Errors.clearSeen()
		page


Meteor.Router.filter 'requireLogin',
  only: 'incidentNew'

#Meteor.Router.filter 'clearErrors'
