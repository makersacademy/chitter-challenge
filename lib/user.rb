class User
  attr_accessor :id, :name, :username, :email, :password, :bio

  def initialize(id = 0, name, username, email, password, bio)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
    @bio = bio
  end
end
