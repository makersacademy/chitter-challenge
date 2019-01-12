window.onload = () => {
    var comment_form = document.getElementById('comment_form');
    hide(comment_form)
    
    // button for showing form
    var comment_button = document.getElementById('comment');
    comment_button.addEventListener('click', show(comment_form));
    
}