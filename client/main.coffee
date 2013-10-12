Meteor.subscribe 'incidents'

Deps.autorun ->
	#console.log 'num Comments in Store is: ' + Comments.find().count()
	Meteor.subscribe 'comments', Session.get 'currentIncidentId'
	Meteor.subscribe 'user_profile', Meteor.userId()
