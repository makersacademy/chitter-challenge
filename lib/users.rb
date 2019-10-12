class Users
  attr_reader :id, :email, :name, :username

  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.create(email, password, name, username)
    result = DatabaseConnection.query("INSERT INTO users
      (email, password, name, username)
      VALUES ('#{email}', '#{password}', '#{name}', '#{username}')
      RETURNING id ")
    @user = Users.new(result[0]['id'], email, password, name, username)
  end

  def self.instance
    @user
  end
end
