

class User

  attr_reader :id, :username, :email, :password

  def initialize(id, username, email, password)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")
    users.map { |element| User.new(element['id'], element['username'], element['email'], element['password']) }
  end

  def self.create(username, email, password)
    DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{password}');")
    user = User.all.last
    User.new(user.id, user.username, user.email, user.password)
  end

  def self.find(id)
    return nil unless id
    users = DatabaseConnection.query("SELECT * FROM users WHERE id=#{id};")
    User.new( users[0]['id'], users[0]['username'], users[0]['email'], users[0]['password'])
  end

end
