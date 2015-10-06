$(document).ready(function() {

$('#deleteSession').click(function() {
    $.ajax({
      url: '/sessions',
      type: 'DELETE'
    });
});

});
