jQuery ->
	$('.toggle').click(->
		console.log 'click'
		$('body').toggleClass('toc-open sidebar-open')
	)