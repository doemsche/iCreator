Meteor.methods
	updateUserProfile: (area) ->	
		user = Meteor.user()
		userId = Meteor.userId()
		#console.log(Meteor.users.findOne({_id:userId}))
		Meteor.users.update({_id:userId}, {$set: {area: area}})