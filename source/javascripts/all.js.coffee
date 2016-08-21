$ ->
	$grid = $('.portfolio-grid').isotope
		itemSelector: '.grid-item',
		layoutMode: 'fitRows',
		percentPosition: true


	filterGrid = (type)->
		if type is 'all'
			$filterType = "*"
		else
			$filterType = ".type-#{type}"
		$grid.isotope
			filter: $filterType

	$('.menu-item').on 'click', ()->
		$type = $(this).data('type')
		filterGrid($type)