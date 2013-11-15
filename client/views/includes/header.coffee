Template.header.helpers
	user: ->
		Meteor.user()

	gravatar:->
		# unless Meteor.user().profile.email
		# 	'/images/gravatar.jpg'
		# else
		# 	Gravatar.imageUrl(Meteor.user().profile.email)

