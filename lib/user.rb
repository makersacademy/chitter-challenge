class User
  attr_accessor :id, :name, :username, :password, :email, :posts

  def initialize
    @posts = []
  end
end