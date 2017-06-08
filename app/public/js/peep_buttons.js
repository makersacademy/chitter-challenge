$(document).ready(function(){
    $("body").on("click", ".like", function(event){
        event.preventDefault();
        var value = $(this).attr("id");
        var to_get = "/like/" + value;
        $.get(to_get, function(){
            var div = " .peep#" + value;
            $(div).load(location.href + div + ">*","");
        });
    });
    $("body").on("click", ".unlike", function(event){
        event.preventDefault();
        var value = $(this).attr("id");
        var to_get = '/unlike/' + value;
        $.get(to_get, function(){
            var div = " .peep#" + value;
            $(div).load(location.href + div + ">*","");
        });
    });
    $("body").on("click", ".archive_button", function(event){
        event.preventDefault();
        var value = $(this).attr("id");
        var to_post = '/archive/' + value;
        $.post(to_post, function(){
            var list = ' ul#posts';
            $(list).load(location.href + list + ">*","");
        });
    });
});