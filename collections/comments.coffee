@Comments = new Meteor.Collection 'comments'


Meteor.methods comment: (commentAttributes) ->

	user = Meteor.user()
	incident = Incidents.findOne(commentAttributes.incidentId)

	throw new Meteor.Error(422, "You must comment on a  existing incident")  unless commentAttributes.incidentId
	throw new Meteor.Error(401, "You need to login to post comments to incidents")  unless user
	throw new Meteor.Error(422, "Please fill in a body")  unless commentAttributes.body
	

	comment = _.extend(_.pick(commentAttributes,"body", "incidentId"),
    	userId: user._id
    	author: user.username
    	submitted: new Date().getTime()
  	)
  	
	commentId = Comments.insert(comment)
	commentId
