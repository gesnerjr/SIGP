$(document).ready(function() {
	
//INITIALIZES PRETTYPHOTO PLUGIN

	$("a[rel^='prettyPhoto']").prettyPhoto({theme:'light_square'}); //choose between different styles / dark_rounded / light_rounded / dark_square / light_square / facebook /
	
//INITIALIZES TWITTER FEED PLUGIN

	$('.twitter-feed').tweet({
		username: 'ivanjezh',  //just enter your twitter username
		join_text: 'auto',
		avatar_size: null,
		count: 2, //number of tweets showing
		auto_join_text_default: '',
		loading_text: 'loading latest tweets...' //text displayed while loading tweets
	});

// FLICKR PLUGIN

	$('#flickr-images').append('<ul></ul>');
	
	$('#flickr-images ul').jflickrfeed({
		limit: 10,
		qstrings: {
			id: 'myflickrID', // enter Flickr ID i.e. 67956216@N02	
			tags: 'tags-here'  // Displays images with selected tags (optional)
		},
		
		itemTemplate: '<li><a href="{{image_b}}" rel="prettyPhoto" ><img src="{{image_s}}" alt="{{title}}" /></a></li>'
		
		}, function(data) {
			$('#flickr-images li a').prettyPhoto({theme:'light_square'});
		});


// TEXTBOX ACTIVE
		
	$('.textbox, #message, #comment').focus(function (){
		$(this).css({borderColor : '#bbb'});
			$(this).blur(function (){
				$(this).css({borderTopColor : '#d1d1d1', borderLeftColor : '#d1d1d1', borderBottomColor : '#e1e1e1', borderRightColor : '#e1e1e1'});
			});
	});

	
	
//TAB NAVIGATION
	
	$('ul.tab-nav').tabs('.tabs > .tab-panels > div', {effect: 'fade'});

	
// PORTFOLIO HOVER EFFECT - OVERLAY
		
	$('.gallery-overlay a img').hover(function() {		
		$(this).stop().animate({ 
			opacity : '.1'
		}, 300);
			}, function() {
				$(this).stop().animate({ 
					opacity : '1' 
				}, 500);
			});	
 
	
// PORTFOLIO FILTER				

	$('ul#filter a').click(function() {
		$(this).css('outline','none');
		$('ul#filter .active-filter').removeClass('active-filter');
		$(this).parent().addClass('active-filter');

		var filterVal = $(this).attr('href').toLowerCase().replace(' ','-');

		if(filterVal == 'all') {
			$('ul.gallery-thumbs li.hidden').fadeIn('slow').removeClass('hidden');
		} else {
			$('ul.gallery-thumbs li').each(function() {
				if(!$(this).hasClass(filterVal)) {
					$(this).fadeOut('normal').addClass('hidden');
				} else {
					$(this).fadeIn('slow').removeClass('hidden');
				}
			});
		}

		return false;
	});	

		
//TOGGLE PANELS

	$('.toggle-content').hide();  //hides the toggled content, if the javascript is disabled the content is visible

	$('.toggle-header a').click(function () {		
		
		if ($(this).is('.tog-close')) {
			$(this).removeClass('tog-close')
			.addClass('tog-open')
			.closest('.toggle-header')
			.next('.toggle-content')
			.slideToggle(300);
			return false;
		} 		
		else {
			$(this).removeClass('tog-open')
			.addClass('tog-close')
			.closest('.toggle-header')
			.next('.toggle-content')
			.slideToggle(300);
			return false;
		}
	});	
		

// TOOLTIPS

	$('.social-links li[title]').tooltip({
		effect: 'fade',
		fadeInSpeed: 300,
		fadeOutSpeed: 200,
		opacity: 0.9,
		offset: [-5, 0]		
	});	
	
	
// SOCIAL LINKS

	$(function() {
		$('.social-links li').animate({
			opacity : '.4'  // sets the opacity to 50% to all social link images
		}); 
		
		$('.social-links li').hover(function() {  
			$(this).stop().animate({ 
				opacity: '1'  // on hover sets the opacity to 100% to all social link images
			});
		}, function() {
				$(this).stop().animate({ 
					opacity : '.4'
				});
			});
	});


// SCROLL TOP	

	$('.scroll-top').hover(function() {		
		$(this).stop().animate({ 
			opacity : '1'
		}, 300);
			}, function() {
				$(this).stop().animate({ 
					opacity : '.6' 
				}, 500);
			});	
			
	$('.scroll-top').click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 800);
		return false;
	});
	
	
//NAVIGATION DROPDOWN ANIMATION	

	$('#navigation ul').css({display: 'none'}); // Opera Fix
	
	$("ul#navigation").superfish({
			hoverClass:    'dropdown',          // the class applied to hovered list items 
			pathClass:     'overideThisToUse', // the class you have applied to list items that lead to the current page 
			pathLevels:    1,                  // the number of levels of submenus that remain open or are restored using pathClass 
			delay:         300,                // the delay in milliseconds that the mouse can remain outside a submenu without it closing 
			animation:     {opacity:'show',height:'show'},     // an object equivalent to first parameter of jQuery’s .animate() method 
			speed:         'fast',           // speed of the animation. Equivalent to second parameter of jQuery’s .animate() method 
			autoArrows:    false,               // if true, arrow mark-up generated automatically = cleaner source code at expense of initialisation performance 
			dropShadows:   false	
	});
	
	
// IE Button hover fix	
$(function (){	

	var button = $('.button');
			
	if ($.browser.msie) {
		$(button).css( {backgroundPosition: "-20px 35px"} ).hover(function() {		
			$(this).stop()
				.animate({ 
					backgroundPositionX: "-20px",
					backgroundPositionY: "94px"				
				},300);
				
				}, 
				function() {
					$(this).stop().animate({ 
					backgroundPositionX: "-20px",
					backgroundPositionY: "35px"				
				},300).css({backgroundPosition: "-20px 35px"});
			});
		}		
});
	
					
});	//END of jQuery





