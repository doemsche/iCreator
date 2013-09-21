@incidents = new Meteor.Collection 'incidents'

#incidents.allow
#  insert: (incident) ->
#  	return false;

#NonEmptyString = Match.Where((x) ->
#  check x, String
#  x.length isnt 0
#)


Meteor.methods createIncident: (options) ->
	#check options,
		#title: NonEmptyString
		#txt: NonEmptyString
	#throw new Meteor.Error(413, "Title too long")  if options.title.length > 100
	throw new Meteor.Error(413, "Description too long")  if options.txt.length > 1000
	#throw new Meteor.Error(403, "You must be logged in")  unless @userId
	console.log( "insert exec")
	incidents.insert
		lat: options.lat
		long: options.long
		#title: options.title
		txt: options.txt


	#callback = ->
		#console.log('callback out of modl')
		#console.log(id)

