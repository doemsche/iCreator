Template.userProfileEdit.helpers
	user: ->
		Meteor.user()


Template.userProfileEdit.events
	'click #userprofile-update': (e) ->
		e.preventDefault()
		area = $('#profile-area').val()
		console.log(area)
		
		Meteor.call 'updateUserProfile', Meteor.userId(), area