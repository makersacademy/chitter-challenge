class User 

  attr_reader :username, :user

  def initialize(username)
    @username = username
  end

  def self.current_user
    @user
  end

  def self.create(username, name, email, password)
    @user = User.new(username)
    DatabaseConnection.query("INSERT INTO users (username, name, email, password) 
    VALUES ('#{username}', '#{name}', '#{email}', '#{password}')
    RETURNING username, name;")
  end

end
