Template.header.helpers
	user: ->
		Meteor.user()

	gravatar:->
		unless Meteor.user()
			'example@example.com'
		else
			Gravatar.imageUrl(Meteor.user().profile.email)

