$(document).ready(function(){
    $("body").on("click", "#peep_link", function(event) {
        event.preventDefault();
        $(".lightbox").css("visibility", "visible");
        $("#close_lightbox").click(function() {
            $(".lightbox").css("visibility", "hidden");
        });
    });
});