Meteor.publish "incidents", ->
	Incidents.find()

Meteor.publish "comments", (incidentId)->
	Comments.find
		incidentId: incidentId

Meteor.publish "incidentUserProfile",(incidentId)->
	Meteor.users.find( _id: Incidents.findOne(incidentId).userId )


Meteor.publish "user_profile", (userId)->
  Meteor.users.find {_id:userId},
    fields:
      area: 1


