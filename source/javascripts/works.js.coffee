$ ->
	$(".menu-item").removeClass "active"

	$(".fancybox").fancybox
		helpers:
		  overlay:
		    css:
		      background: "rgba(3, 3, 3, 0.95)"