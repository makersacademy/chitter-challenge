class User

  attr_reader :email, :password, :name, :username

  def initialize(email, password, name, username)
    @email = email
    @password = password
    @name = name
    @username = username
  end
 

  def add_user
    DatabaseConnection.query("INSERT INTO peeps (email, password, name, username) VALUES('#{@email}', '#{@password}', '#{@name}', '#{@username}') RETURNING email, password, name, username;")
  end
end
