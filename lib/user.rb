class User
  attr_accessor :id, :username, :password, :email, :posts

  def initialize
    @posts = []
  end
end