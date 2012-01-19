# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#landing_page_industry_name').autocomplete
		source: $('#landing_page_industry_name').data('ac-source')
	$('#landing_page_landing_page_type_name').autocomplete
		source: $('#landing_page_landing_page_type_name').data('autocomplete-source')
	$('#landing_page_release_date').datepicker
		dateFormat: 'yy-mm-dd' 
	
	$(".vote.add").live 'click', ->
		$.post(this.href, {_method:'vote'}, null, "script");
		console.log "clicked", $(this)
		num = $(this).html()
		$(this).html(parseInt(num) + 1).removeClass('add').removeAttr('href')
		return false
	$(".bigbox a.lightbox").fancybox 
		buttons: 
			position: 'top'
	$(".sidebar li.left, .sidebar li.right").hover (->
	  $(this).children().children(".arrow").show()
	), ->
	  $(this).children().children(".arrow").hide()
						