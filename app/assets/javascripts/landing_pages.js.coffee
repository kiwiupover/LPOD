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
		maxWidth: 1070
		maxHeight: 1200
		fitToView: false
		width: '100%'
		height: '80%'
		scrolling: 'yes'
		type: 'iframe'
	
	$("input#landing_page_keyword").live "blur", ->
	  link = $("input#landing_page_keyword").val()
		 $('#keyword_spy_url').html("<h3><a target='_blank' href='http://www.keywordspy.com/research/search.aspx?q=" + link + "&type=keywords'>Keyword Spy</a></h3>");
			  
	$("input#landing_page_url").live "blur", ->
	  link = $("input#landing_page_url").val()
		 $('#alexa_url').html("<a target='_blank' href='http://www.alexa.com/search?q=" + link + "'>alexa.com</a>");
	
		
	
	$(".sidebar li.left, .sidebar li.right").hover (->
	  $(this).children().children(".arrow").fadeIn()
	), ->
	  $(this).children().children(".arrow").hide()
	
	

						