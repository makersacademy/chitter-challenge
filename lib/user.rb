class User
  attr_accessor :id, :username, :email, :password

  def initialize(id = 0, username, email, password)
    @id = id
    @username = username
    @email = email
    @password = password
  end
end
