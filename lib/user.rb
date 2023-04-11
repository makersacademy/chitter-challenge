class User
  attr_accessor :username, :email, :password

  def initialize(username, email, password)
    @username = username
    @email = email
    @password = password
  end
end
