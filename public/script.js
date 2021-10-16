$( document ).ready(function() {
   $('body').on('click','.close',function(){
          $(this).closest('.toast').toast('hide')
        })
});