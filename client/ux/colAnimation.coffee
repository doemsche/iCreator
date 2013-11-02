@I_animate = ($element, options)->
	callAnimation = (i=0) ->
		$element.animate
			backgroundColor: do ->
				if(i%2) 
					options.endColor
				else
					options.startColor
			,options.time
			,->
				i++
				if i > options.cycle
					return false
				else
					callAnimation()
	callAnimation()