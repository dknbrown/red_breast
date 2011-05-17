// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {
	 
	 var arrSlogans = new Array(
	 "Changing The Way We Aggregate Stupid Data", 
	 "From Dry Shrubby Fields to Wet Bottom-land Forests",
	 "Changing The Way You Ignore Us Online");

	$('#slogan').text(arrSlogans[Math.floor(Math.random()*arrSlogans.length)]);
  
	weather_val = $("#wconditions").text();
	if ( weather_val < 10 ) {
		$("#wimage").attr("src","images/low.png");
	} else if ( weather_val < 30 ) {
		$("#wimage").attr("src","images/lowmid.png");
	} else if ( weather_val < 60 ) {
		$("#wimage").attr("src","images/highmid.png");
	}else if ( weather_val >60 ) {
		$("#wimage").attr("src","images/high.png");
	}
  
	$('#refresh-link').click(function(event){
		//alert("app js");
		// $.getScript('/items.js');
		event.preventDefault(); // Prevent link from following its href
	});
  
  
	
    
});
