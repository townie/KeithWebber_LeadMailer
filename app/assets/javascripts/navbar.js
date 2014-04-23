$(document).ready(function() {
  $('aside').css('min-height', $(window).innerHeight());
  $('.inner-wrap').css('min-height', $(window).innerHeight());



  });

 $(window).scroll(function(e){

    $el = $('.side-nav');
    if ($(window).scrollTop() > 1 ){
      var resize= $(window).scrollTop()
      $('.side-nav').css({'position': 'fixed', 'top' : resize +'px' });
    }
    else if ($(window).scrollTop() == 0) {
      $('.side-nav').css({'position': 'fixed', 'top' : '0px' });
    }
 });
