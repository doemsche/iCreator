Template.incidentEdit.helpers
	incident: ->
		Incidents.findOne( Session.get 'currentIncidentId' )
	comments: ->
		Comments.find incidentId: Session.get 'currentIncidentId'

Template.incidentEdit.events
	'click #incident-cancel': (e) ->
		e.preventDefault()
		Meteor.Router.to "incidentDetailPage", Session.get 'currentIncidentId'

	'click #incident-update': (e) ->
		e.preventDefault()
		incident=
			_id: Session.get 'currentIncidentId'
			brand: $('#incidentBrand').val()
			story: $('#incidentStory').val()
			date: $('#incidentDate').val()
			timeStart: $('#incidentTimeStart').val()
			timeEnd: $('#incidentTimeEnd').val()

		Meteor.call 'updateIncident', incident
		Meteor.Router.to "incidentsList"

	'click #incident-delete': (e) ->
		e.preventDefault()
		if confirm( 'Vorfall wirklich löschen?')
			incidentId = Session.get "currentIncidentId"
			Incidents.remove incidentId
			Meteor.call 'removeIncidentComments', incidentId
			Meteor.Router.to "incidentsList"
		else
			Meteor.Router.to "incidentDetailPage", Session.get 'currentIncidentId'