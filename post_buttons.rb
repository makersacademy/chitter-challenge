
def post_buttons(post)
  @unlike = "<a href='#' class='unlike' id='#{post.id}'><div class='likes_red'><img src='http://michael-jacobson.co.uk/red_heart.png' class='heart_image'>#{post.likes}</div></a>"
  @delete = "<a href='/delete/#{post.id}' class='delete_button' id='#{post.id}'><img src='http://michael-jacobson.co.uk/trash.png' class='delete_image'></a>"
  @like = "<a href='#' class='like' id='#{post.id}'><div class='likes_grey'><img src='http://michael-jacobson.co.uk/grey_heart.png' class='heart_image'>#{post.likes}</div></a>"
  @logged_out_likes = "<div class='likes_grey_logged_out'><img src='http://michael-jacobson.co.uk/grey_heart.png' class='heart_image'>#{post.likes}</div>"
  if current_user
    return "#{@unlike}\r\n#{@delete}" if @liked && current_user.id == peep.user_id
    return @unlike if @liked && current_user != peep.user_id
    return "#{@like}\r\n#{@delete}" if !@liked && current_user.id == peep.user_id
    return @like if !@liked && current_user.id != peep.user_id
  else
    @logged_out_likes
  end
end
