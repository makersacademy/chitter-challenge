class User
  attr_reader :id, :username, :password, :email

  def initialize(id:, username:, password:, email:)
    @id = id
    @username = username
    @password = password
    @email = email
  end

  def self.find(user_id)
    rs = DatabaseConnection.query('SELECT * FROM users WHERE id = $1;', [user_id])
    return rs[0]['id']
  end

  def self.find_by(username:)
    rs = DatabaseConnection.query('SELECT * FROM users WHERE username = $1;', [username])
    User.new(id: rs[0]['id'], username: rs[0]['username'], password: rs[0]['pw'], 
email: rs[0]['email'])
  end

  def self.create(username:, password:, email:)
    rs = DatabaseConnection.query('INSERT INTO users (username, pw, email) VALUES ($1, $2, $3) RETURNING id, username, pw, email;',
    [username, password, email]) 

    User.new(id: rs[0]['id'], username: rs[0]['username'], password: rs[0]['pw'], 
email: rs[0]['email'])
  end

  def authenticate(password:)
    rs = DatabaseConnection.query('SELECT * FROM users WHERE pw = $1', [password])
    return true if @password == password
  end
end
