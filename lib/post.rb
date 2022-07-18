
class Post

  attr_accessor :id, :post_date, :title, :content, :user_id, :username

  def new_post(post_date,title,content, user_id, username)
    @post_date = post_date
    @title = title
    @content = content
    @user_id = user_id
    @username = username
  end
end 
