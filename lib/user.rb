class User
  attr_reader :username, :email, :password
  def initialize username, email, password
    @username = username
    @email = email
    @password = password
  end
end
