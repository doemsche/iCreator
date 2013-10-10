Meteor.publish "incidents", ->
	Incidents.find()

Meteor.publish "comments", (incidentId)->
	Comments.find
		incidentId: incidentId
