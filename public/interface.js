$(document).ready(function() {


  $("#flip").click(function(){
    $("#panel").slideToggle("slow");
  });

  $("#panel").click(function(){
    $("#panel").slideToggle("slow");
  });

  $("#flip2").click(function(){
    $("#panel2").slideToggle("slow");
  });

  $('#flash-notice').click(function(){
    $('#flash-notice').slideUp("slow");
  });

  $(function(){
      if (window.location.pathname == "/chitter/feed") {
            $('.sort-menu').show();
      } else {
            $('.sort-menu').hide();
      }
  });

});
