# // This is a manifest file that'll be compiled into application.js, which will include all the files
# // listed below.
# //
# // Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# // or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# //
# // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# // compiled file.
# //
# // Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# // about supported directives.
# //
# //= require jquery
# //= require jquery_ujs
# //= require turbolinks
# //= require_tree .

$ ->
	menu = $('#navigation-menu')
	menuToggle = $('#js-mobile-menu')
	signUp = $('sign-up')

	menuToggle.on 'click', (e)->
		e.preventDefault()
		menu.slideToggle ->
			menu.removeAttr('style') if menu.is(':hidden')

	    $(".nav .nav-link").click -> 
	     $(".nav .nav-link").each ->
	     $(this).removeClass "active-nav-item"

	    $(this).addClass "active-nav-item"
	    $(".nav .more").removeClass "active-nav-item"

	$(".js-menu-trigger").on "click touchstart", (e)->
		$(".js-menu").toggleClass "is-visible"
		$(".js-menu-screen").toggleClass "is-visible"
		e.preventDefault()

	$(".js-menu-screen").on "click touchstart", (e)->
		$(".js-menu").toggleClass "is-visible"
		$(".js-menu-screen").toggleClass "is-visible"
		e.preventDefault()