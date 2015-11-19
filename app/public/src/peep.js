$(document).ready(function() {
  $('#make_a_peep').focus(function() {
    $('#make_a_peep').animate({height:'105px'});
    $('#peep_container').animate({height:'160px'});
    $('#submit_a_peep').show();
  });


  var inp = $('#make_a_peep').val();

  $('#make_a_peep').keypress(function(e) {
    $('#submit_a_peep').show();
  });
});
