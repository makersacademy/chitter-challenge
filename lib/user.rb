class User
  attr_accessor :id, :name, :username, :email, :password

  def initialize(id = 0, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end
end
