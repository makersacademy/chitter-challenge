class User
  attr_reader :username, :email, :name, :password

  def initialize(username, email, name, password)
    @username = username
    @email = email
    @name = name
    @password = password
  end
end
