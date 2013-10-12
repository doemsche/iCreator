Handlebars.registerHelper 'userProfileComplete', ->
	user = Meteor.user()
	unless user is null
		unless user.area is undefined
			false
		else
			true
	else
		null