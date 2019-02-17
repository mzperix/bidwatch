$(document).ready(function(){

  $("input#mainSearch").width($(window).width()-50); 
  $("div#divCoin").width((($(window).width()-150)/3));
  $("div#divData1").width((($(window).width()-150)/3));
  $("div#divData2").width((($(window).width()-150)/3));


  /*$("img#imgNetwork_1").hide();
  $("img#imgHover_1").hide();
  
  $("input#mainSearch").focus(function(){
    $(this).val('');
  });
  
  $("input#mainSearch").keypress(function(event){
		if($(this).val() == "whitefish")
		{
			 if (event.keyCode == 13) { 
			  		 $("img#imgNetwork_1").show();
			 		 $("html, body").animate({ scrollTop: $(document).height() }, "slow");
  			 		 return false;
  			 }
 		}
});

$("div#divImg1").mouseover(function(){
  $("img#imgHover_1").show();
});


$("div#divImg1").mouseout(function(){
  $("img#imgHover_1").hide();
});
*/


 /*$("div#divData1").width((window.width()-150)/3));*/


/* scrolling the window 

$(window).scroll(function(){
  $('.#h1_Search').each(function(){
    if(isScrolledIntoView($(this))){
      $(this).css('top').text('0');
    }
    else{
      
    }
  });
});

function isScrolledIntoView(elem){
    var $elem = $(elem);
    var $window = $(window);

    var docViewTop = $window.scrollTop();
    var docViewBottom = docViewTop + $window.height();

    var elemTop = $elem.offset().top;
    var elemBottom = elemTop + $elem.height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop)); */
    
});