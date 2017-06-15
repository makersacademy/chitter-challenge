$(document).ready(function(){
    $('#sign_up_button').on("click", function() {
        $('#signup_lightbox').css("visibility", "visible");
        $("title").html("TinyBlogger | Sign Up");
        $("#close_lightbox").click(function() {
            $("#signup_lightbox").css("visibility", "hidden");
            $("title").html("TinyBlogger | Home");
        });
    });
});