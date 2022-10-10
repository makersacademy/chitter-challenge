class Maker
  attr_accessor :email, :password, :name, :username

  def initialize(email, password, name, username)
    @email = email
    @password = password
    @name = name
    @username = username
  end
end
