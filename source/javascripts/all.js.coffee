$ ->
	$grid = $('.portfolio-grid').isotope
		itemSelector: '.grid-item',
		layoutMode: 'fitRows',
		percentPosition: true, 
		fitRows:
			gutter: 15

	$grid.isotope 'shuffle'

	filterGrid = (type)->
		if type is 'all'
			$filterType = "*"
		else
			$filterType = ".type-#{type}"
		$grid.isotope
			filter: $filterType

	$('.menu-item').on 'click', ()->
		$('.menu-item').removeClass 'active'
		$(this).addClass 'active'
		$type = $(this).data('type')
		filterGrid($type)