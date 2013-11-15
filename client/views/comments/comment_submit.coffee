Template.commentSubmit.events
	'keydown' : (e) ->
		if e.which is 13
			unless e.shiftKey
				e.preventDefault()
				comment =
					body: e.target.value,
					incidentId:  Session.get 'currentIncidentId'

				Meteor.call 'comment', comment, (error, commentId) ->
					if error
						Errors.throw error.reason
					else
						e.target.value = ""		
		
