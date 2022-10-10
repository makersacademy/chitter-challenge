class User
  def initialize(username = '', password = '', name = '', email = '')
    @username = username
    @password = password
    @name = name
    @email = email
  end

  attr_accessor :username, :password, :name, :email

  def ==(other)
    self.username == other.username && self.password == other.password
  end
end