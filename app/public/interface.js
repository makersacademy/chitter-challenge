$(document).ready(function() {

  $('#bird_homepage').fadeTo('slow', 1);

  $('#bird_homepage').animate({
    right: '510px',
    top: '250px',
    height: '250px',
    width: 'auto'
  });

  $('#bird_homepage').mouseenter(function() {
    $('#bird_speech').text("Peep peep...");
  });

  $('#bird_homepage').mouseleave(function() {
    $('#bird_speech').text("");
  });


});
