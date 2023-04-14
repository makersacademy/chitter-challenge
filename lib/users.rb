class User
  attr_accessor :id, :name, :username, :email, :password_hash

  def initialize(id:, name:, username:, email:, password_hash:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password_hash = password_hash
  end
end
