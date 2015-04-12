$( document ).ready(function() {
  $('.peep-box').click(function(e) {
    if($(e.target).is('input')){
            e.preventDefault();
            return;
        }
    autoHeight = $('.comment-container', this).css('height', 'auto').height();
    $('.comment-container', this).toggle(
    function(){
        $('.comment-container', this).animate({
          height: autoHeight
        });
        $('.comment-container', this).css(
          "display", "block"
        );
    },
    function(){
        $('.comment-container', this).animate({
          height: 0
        });
        $('.comment-container', this).css(
          "display", "none"
        );
    });
  });
});