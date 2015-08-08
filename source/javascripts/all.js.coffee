$ ->
	
	$(".menu-item").on "click", ()->
		checkActiveNav()
		section = $(this).data("section")
		$("html, body").animate
			scrollTop: $(section).offset().top + 1
		, 1500

	checkActiveNav = ()->
		current = $(document).scrollTop()
		codeOffset = $("#code-section").offset().top
		wordsOffset = $("#words-section").offset().top
		imagesOffset = $("#images-section").offset().top
		$(".menu-item").removeClass "active"
		if (current < wordsOffset)
			$(".code-menu").addClass "active"
		else if (current >= wordsOffset and current < imagesOffset) 
			$(".words-menu").addClass "active"
		else
			$(".images-menu").addClass "active"

	window.onscroll = checkActiveNav
