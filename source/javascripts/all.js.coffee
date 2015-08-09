$ ->

	scrollToSection = (section)->
		$("html, body").animate
			scrollTop: section.offset().top + 1
		, 1500
	
	$(".menu-item").on "click", ()->
		checkActiveNav()
		section = $(this).data("section")
		scrollToSection $(section)

	checkActiveNav = ()->
		offset = 30
		current = $(document).scrollTop()
		codeOffset = $("#code-section").offset().top
		wordsOffset = $("#words-section").offset().top - offset
		imagesOffset = $("#images-section").offset().top - (offset*3)
		$(".menu-item").removeClass "active"
		if (current < wordsOffset)
			$(".code-menu").addClass "active"
		else if (current >= wordsOffset and current < imagesOffset) 
			$(".words-menu").addClass "active"
		else
			$(".images-menu").addClass "active"

	window.onscroll = checkActiveNav

	$(".tile-hover").on "mouseenter", ()->
		imgSrc = $(this).data("hover")
		$(this).css "background-image", imgSrc

	$(".tile-hover").on "mouseleave", ()->
		imgSrc = $(this).data("original")
		$(this).css "background-image", imgSrc


	$(".subsection").hide()
	$(".subsection-link").on "click", ()->
		$(".subsection").fadeOut()
		section = $(this).data("link")
		$(section).fadeIn "slow"
		setTimeout ()->	
			scrollToSection $(section)
		, 500

	$(".fancybox").fancybox
		helpers:
		  overlay:
		    css:
		      background: "rgba(3, 3, 3, 0.95)"

