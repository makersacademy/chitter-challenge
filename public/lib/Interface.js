
$( document ).ready(function(){
  
  $( ".comment-btn" ).click(function(){

    var messageNum = this.className.split('').slice(-1)[0]
    $( "#comment-form-" + messageNum).toggle();

  })

  $( ".see-comments").click(function(){
    var overlayNum = this.className.split('').slice(-1)[0]
    $( ".overlay-" + overlayNum ).css("display", "block")

  })

  $( ".closebtn" ).click(function(){
    var overlayNum = this.className.split('').slice(-1)[0]
    $( ".overlay-" + overlayNum ).css("display", "none")

  })

})
