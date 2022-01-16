class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def User.all
    # will return all users

    connection = db_connect
    users = connection.exec('SELECT * FROM users ORDER BY id DESC;')
    users.map do |user| 
      User.new(id: user['id'],
        name: user['name'],
        username: user['username'], 
        password: user['password'], 
        email: user['email'])
    end
  end

  def User.sign_up(name:, username:, password:, email:)
      connection = db_connect
      result = connection.exec_params(
      'INSERT INTO users (name, username, password, email) 
      VALUES ($1, $2, $3, $4) RETURNING id, name, username, password, email;', 
      [name, username, password, email])
    
      User.new(id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'], 
      password: result[0]['password'], 
      email: result[0]['email'])
  end

    def User.db_connect
      if 'test' == ENV['ENVIRONMENT']
        connection = PG.connect(dbname: 'chitterbase_test')
      else 
        connection = PG.connect(dbname: 'chitterbase')
      end
    end
end