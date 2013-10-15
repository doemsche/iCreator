Template.header.helpers
	user: ->
		Meteor.user()

	gravatar:->
		Gravatar.imageUrl(Meteor.user().profile.email)

