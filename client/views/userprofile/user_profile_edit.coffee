Template.userProfileEdit.helpers
	user: ->
		Meteor.user()


Template.userProfileEdit.events
	'click #userprofile-update': (e) ->
		e.preventDefault()
		userProfile=
			location: $('#profile-location').val()
			address: $('#profile-address').val()


		Meteor.call 'updateUserProfile', userProfile
		Meteor.Router.to "incidentsList"