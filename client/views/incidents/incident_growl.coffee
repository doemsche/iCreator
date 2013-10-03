Template.incidentGrowl.growl = ->
	incident = Incidents.findOne( Session.get("growl-view") )
	if incident
		title = incident.title
		id = incident._id
		href = "<a href='incident/#{id}'>#{title}</a>"
		$.bootstrapGrowl( href )

	

# Template.incidentDetail.rendered = ->
# 	$.bootstrapGrowl("<div background-color='red'>Dominik</div>");