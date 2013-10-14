Meteor.methods
	updateUserProfile: (userProfile) ->	
		user = Meteor.user()
		console.log user
		#console.log(Meteor.users.findOne({_id:userId}))
		Meteor.users.update({_id:user._id}, {$set:{profile: userProfile}})