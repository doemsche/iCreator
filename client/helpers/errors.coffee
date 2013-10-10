@Errors = new Meteor.Collection null

@throwError = (message) ->
	Errors.insert {message:message}

@clearErrors = ->
	Errors.remove {}, ->


