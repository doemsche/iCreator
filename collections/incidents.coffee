@Incidents = new Meteor.Collection 'incidents'

Incidents.allow
  update: ownsDocument
  remove: ownsDocument


Meteor.methods
	incident: (incidentAttributes) ->
		user = Meteor.user()

		throw new Meteor.Error(401, "You need to login to post new stories")  unless user
		#throw new Meteor.Error(422, "Please fill in a title")  unless incidentAttributes.title
		#throw new Meteor.Error(422, "Please fill in a description")  unless incidentAttributes.descr
		throw new Meteor.Error(422, "Your incident lacks of location information (Lattitude missing)")  unless incidentAttributes.lat
		throw new Meteor.Error(422, "Your incident lacks of location information (Longitude missing)")  unless incidentAttributes.lng
		#throw new Meteor.Error(422, "Lattitude can only contain Numbers") unless  /^-?\d*(\.\d+)?$/.test(incidentAttributes.lat)
		#throw new Meteor.Error(422, "Longitude can only contain Numbers") unless  /^-?\d*(\.\d+)?$/.test(incidentAttributes.long)

		incident = _.extend(_.pick(incidentAttributes,
							"brand",
							"color",
							"date",
							"timeStart",
							"timeEnd",
							"lat",
							"lng",
							"story"),
	    	userId: user._id
	    	author: user.username
	    	submitted: new Date().getTime()
	  	)
	  	
		incidentId = Incidents.insert(incident)
		incidentId

	updateIncident: (incidentAttributes) ->
		incident = Incidents.findOne({_id: incidentAttributes._id})
		incidentUpdate = _.extend(_.pick(incidentAttributes,
			"brand",
			"date",
			"timeStart",
			"timeEnd",
			"story")
		)
		Incidents.update({_id:incident._id}, incidentUpdate)
