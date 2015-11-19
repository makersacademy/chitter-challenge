$(document).ready(function() {
  $('#make_a_peep').focus(function() {
    $('#make_a_peep').animate({height:'105px'});
    $('#peep_container').animate({height:'160px'});
    $('#submit_a_peep').show();
  });


  var inp = $('#make_a_peep').val();

  if (jQuery.trim(inp).length === 0) {
    $('#make_a_peep').blur(function() {
      $('#make_a_peep').css('height', '35px');
      $('#peep_container').animate({height:'55px'});
      $('#submit_a_peep').hide();
    });
  }
});
