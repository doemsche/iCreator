Template.userProfileEdit.helpers
	user: ->
		Meteor.user()


Template.userProfileEdit.events
	'click #userprofile-cancel': (e)->
		e.preventDefault()
		Meteor.Router.to "userProfile", Meteor.user()

	'click #userprofile-update': (e) ->
		e.preventDefault()
		userProfile=
			location: $('#profile-location').val()
			address: $('#profile-address').val()
			email: $('#profile-email').val()


		Meteor.call 'updateUserProfile', userProfile
		Meteor.Router.to "incidentsList"