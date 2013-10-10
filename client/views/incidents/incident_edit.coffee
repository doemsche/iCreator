Template.incidentEdit.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' )
	comments: ->
		Comments.find incidentId: Session.get 'currentIncidentId'

Template.incidentEdit.events
	'click #incident-cancel': (e)->
		e.preventDefault()
		Meteor.Router.to "incidentDetailPage", Session.get 'currentIncidentId'

	'click #incident-delete': (e) ->
		e.preventDefault()
		if confirm( 'Do you really want to delte da shit?')
			incidentId = Session.get "currentIncidentId"
			Incidents.remove incidentId
			Meteor.call 'removeIncidentComments', incidentId
			Meteor.Router.to "incidentsList"
		else
			Meteor.Router.to "incidentDetailPage", Session.get 'currentIncidentId'