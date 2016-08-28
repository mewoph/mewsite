$ ->
	$('.lazyload').lazyload
		effect: 'fadeIn',
		threshold: 100

	$grid = $('.portfolio-grid').isotope
		itemSelector: '.grid-item',
		layoutMode: 'fitRows',
		percentPosition: true, 
		transitionDuration: 800,
		fitRows:
			gutter: 15

	filterGrid = (type)->
		if type is 'all'
			$filterType = "*"
			$grid.isotope
				filter: $filterType
			$grid.isotope 'shuffle'
		else
			$filterType = ".type-#{type}"
			$grid.isotope
				filter: $filterType

	showGrid = (type)->
		location.href = "/?filter=#{type}"

	isHomePage = ()->
		return location.href.indexOf('work') is -1

	getQueryParam = (key)->
    	regex = new RegExp("[?&]" + key + "(=([^&#]*)|&|#|$)")
    	results = regex.exec(location.href)
    	if (results && results[2]) 
    		decodeURIComponent(results[2].replace(/\+/g, " "))

	$('.menu-item').on 'click', ()->
		$('.menu-item').removeClass 'active'
		$(this).addClass 'active'
		$type = $(this).data('type')
		if isHomePage()
			filterGrid($type)
		else
			showGrid($type)

	$(window).load ->
		if isHomePage()
			filterParam = getQueryParam('filter')
			if filterParam
				filterGrid(filterParam)
			else
				$grid.isotope 'shuffle'
