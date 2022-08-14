class Post
  attr_accessor :id, :content, :date_created, :user_id, :user, :posted_by

  def initialize
    @user = []
  end 
end