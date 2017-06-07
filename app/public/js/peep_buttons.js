$(document).ready(function(){
    $("body").on("click", ".like", function(event){
        event.preventDefault();
        var value = $(this).attr("id");
        var to_get = "/like/" + value;
        $.get(to_get, function(){
            div = " .peep#" + value;
            $(div).load(location.href + div + ">*","");
        });
    });
    $("body").on("click", ".unlike", function(event){
        event.preventDefault();
        var value = $(this).attr("id");
        var to_get = '/unlike/' + value;
        $.get(to_get, function(){
            div = " .peep#" + value;
            $(div).load(location.href + div + ">*","");
        });
    });
    $("body").on("click", ".delete_button", function(event){
        event.preventDefault();
        var value = $(this).attr("id");
        var to_get = '/delete/' + value;
        $.get(to_get, function(){
            div = " .peep#" + value;
            $(div).load(location.href + div + ">*","");
        });
    });
});