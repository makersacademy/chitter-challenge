class Post
  attr_accessor :id, :content, :date_created, :user_id, :user

  def initialize
    @user = []
  end 
end