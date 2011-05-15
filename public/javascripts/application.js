// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {
	 

  
  $('#refresh-link').click(function(event){
	alert("app js");
   // $.getScript('/items.js');
    event.preventDefault(); // Prevent link from following its href
  });
  
  
	
    
});
