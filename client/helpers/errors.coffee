@Errors = new Meteor.Collection null

@throwError = (message) ->
	Errors.insert {message:message}

@clearErrors = ->
	console.log 'clear errors called in errors.coffee'
	Errors.remove {}, ->
		#console.log Errors.find().count()
