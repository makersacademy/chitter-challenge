$(document).ready(function(){
    $("body").on("click", "#peep_link", function(event) {
        event.preventDefault();
        $("#new_post_lightbox").css("visibility", "visible");
        $("title").html("TinyBlogger | New Tinypost");
        $("#close_lightbox").click(function() {
            $("#new_post_lightbox").css("visibility", "hidden");
            $("title").html("TinyBlogger | Home");
        });
    });
});