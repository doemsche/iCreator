Handlebars.registerHelper 'userProfileComplete', ->
	user = Meteor.user()
	unless user is null
		unless user.area is undefined
			false
		else
			true
	else
		null

Handlebars.registerHelper 'tabClassName', (route) ->
	if Session.equals 'currentPage', route
		'active'
	else
		''

Handlebars.registerHelper 'toDate', (unixTimeStamp) ->
	date =  new Date(unixTimeStamp)

	return date.getDate() + 
    "." +  date.getMonth() +
    "." +  date.getFullYear();


Handlebars.registerHelper 'gravatar', ->
		'/images/gravatar.jpg'
		# unless Meteor.user().profile.email
			
		# 	'/images/gravatar.jpg'
		# else
		# 	Gravatar.imageUrl(Meteor.user().profile.email)