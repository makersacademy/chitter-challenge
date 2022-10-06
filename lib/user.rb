class User
  def initialize(username = '', password = '', name = '', email = '')
    @username = username
    @password = password
    @name = name
    @email = email
  end

  attr_accessor :username, :password, :name, :email
end