$(document).ready(function(){
    $("body").on("click", "#peep_link", function(event) {
        event.preventDefault();
        $('.lightbox').css('visibility', 'visible');
    });
});