@I_animate = ($element, options)->
	$element.animate
		backgroundColor: options.endColor
		,options.time


		# $el.animate
		# 	backgroundColor: "rgb(95,195,95)"
		# 	,300
		# 	,->
		# 		$el.animate
		# 			backgroundColor: "rgb(0,0,0,0)"
		# 			,300
		# 			,->
		# 				$el.animate
		# 					backgroundColor: "rgb(95,195,95)"
		# 					,300
		# 					,->
		# 						$el.animate
		# 							backgroundColor: "rgb(0,0,0,0)"
		# 							,300
		# 							,->
		# 								$el.animate
		# 									backgroundColor: "rgb(95,195,95)"
		# 									,300
		# 									,->
		# 										$el.animate
		# 											backgroundColor: "rgb(0,0,0,0)"
		# 											,300