class User
  attr_reader :email, :password, :name, :username

  def initialize(email, password, name, username)
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |row| User.new(row['email'], row['password'], row['name'], row['username']) }
  end

  def self.create(email, password, name, username)
    DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{password}', '#{name}', #{username});")
  end
end
