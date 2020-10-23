class User
  attr_reader :username, :name, :email

  def initialize(username, name, email)
    @username = username
    @name = name
    @email = email
  end
end
