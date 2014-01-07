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
	addZero = (input) ->
		if input < 9
			return ("0"+input).toString()
		else
			return input.toString()

	day = addZero(date.getDate())
	month = addZero( (date.getMonth() + 1) )
	year = date.getFullYear().toString()

	dateFormatted = day + "/" + month + "/" + year
	return dateFormatted;


Handlebars.registerHelper 'gravatar', ->
		'/images/gravatar.png'
		# unless Meteor.user().profile.email
			
		# 	'/images/gravatar.jpg'
		# else
		# 	Gravatar.imageUrl(Meteor.user().profile.email)

Handlebars.registerHelper 'guistate', ->
	unless Session.get 'gui-state'
		Session.get 'gui-state'
	else
		1