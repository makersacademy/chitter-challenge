class User
  attr_reader :name, :username, :email, :password

  def initialize(name:, username:, email:, password:)
    @name = name
    @username = username
    @email = email
    @password = password
  end
end
