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
    if rs.ntuples != 0
      User.new(id: rs[0]['id'], username: rs[0]['username'], password: rs[0]['pw'], email: rs[0]['email'])
    else
      return false
    end
  end

  def self.create(username:, password:, email:)
    rs = DatabaseConnection.query('INSERT INTO users (username, pw, email) VALUES ($1, $2, $3) RETURNING id, username, pw, email;',
    [username, password, email]) 

    User.new(id: rs[0]['id'], username: rs[0]['username'], password: rs[0]['pw'], 
email: rs[0]['email'])
  end

  def self.authenticate(username:, password:)
    rs = DatabaseConnection.query('SELECT * FROM users WHERE EXISTS(SELECT * FROM users WHERE username = $1 AND pw = $2);', [username, password])
    if rs.ntuples > 0
      return true
    else 
      return false
    end
  end
end
