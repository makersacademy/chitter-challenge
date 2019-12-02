class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end
end
