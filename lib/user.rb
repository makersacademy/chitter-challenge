class User 
  attr_reader :user_id, :name, :username, :email, :password

  def initialize(user_id:, name:, username:, email:, password:)
    @user_id = user_id
    @name = name 
    @username = username
    @email = email
    @password = password
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1 AND password = $2;", [email, password])
    result.none? ? nil :
      User.new(
        user_id: result[0]['user_id'], 
        name: result[0]['name'],
        username: result[0]['username'], 
        email: email,
        password: password)
  end

  def self.add(name, username, email, password)
    result = DatabaseConnection.connection.exec_params("
      INSERT INTO users (name, username, email, password) 
      VALUES ($1, $2, $3, $4) RETURNING user_id, name, username, email, password;", 
      [name, username, email, password])
    User.new(
      user_id: result[0]['user_id'], 
      name: name, 
      username: username, 
      email: email, 
      password: password)
  end

  def self.all
    results = DatabaseConnection.query('SELECT * FROM users;')
    @users = results.map { |result| User.new(
      user_id: result['user_id'], 
      name: result['name'], 
      username: result['username'], 
      email: result['email'], 
      password: result['password'])
    }
  end  

  def self.find(id:)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = #{id}")
    User.new(
      user_id: result[0]['user_id'], 
      name: result[0]['name'], 
      username: result[0]['username'], 
      email: result[0]['email'], 
      password: result[0]['password'])
  end
end
