class User 

<<<<<<< HEAD
  attr_reader :username, :name, :email, :password, :user

  def initialize(username, name, email, password)
    @username = username
    @name = name
    @email = email
    @password = password
=======
  attr_reader :username, :user

  def initialize(username)
    @username = username
>>>>>>> assets
  end

  def self.current_user
    @user
  end

  def self.create(username, name, email, password)
<<<<<<< HEAD
    @user = User.new(username, name, email, password)
  end

end
=======
    @user = User.new(username)
    DatabaseConnection.query("INSERT INTO users (username, name, email, password) 
    VALUES ('#{username}', '#{name}', '#{email}', '#{password}')
    RETURNING username, name;")
  end

end

>>>>>>> assets
