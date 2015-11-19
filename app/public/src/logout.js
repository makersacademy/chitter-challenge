$(document).ready(function() {

  $('#deleteSession').click(function(event) {
    $.ajax({
      url: '/sessions',
      type: 'DELETE',
    });
  });

});
