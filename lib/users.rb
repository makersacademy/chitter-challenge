class Users
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
    @password = password
  end

  def self.create(id, email, password, name, username)
    Users.new(
      id: id,
      email: email,
      password: password,
      name: name,
      username: username)
  end
end
