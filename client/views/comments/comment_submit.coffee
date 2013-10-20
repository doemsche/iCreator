Template.commentSubmit.events
	'submit form': (e, template) ->
		e.preventDefault()
		
		$body = $(e.target).find('[name=body]')
		comment =
			body: $body.val(),
			incidentId:  Session.get 'currentIncidentId'

		Meteor.call 'comment', comment, (error, commentId) ->
			if error
				Errors.throw error.reason
			else
				$body.val ""