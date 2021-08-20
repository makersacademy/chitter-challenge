class User 
  attr_reader :user_id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @user_id = id
    @name = name 
    @username = username
    @email = email
    @password = password
  end

  def self.add(name, username, email, password)
    connect_db
    result = @connection.exec_params("INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4) RETURNING user_id, name, username, email, password;", [name, username, email, password])
    User.new(
      id: result[0]['user_id'], 
      name: name, 
      username: username, 
      email: email, 
      password: password
    )
  end

  def self.all
    connect_db
    results = @connection.exec('SELECT * FROM users;')
    @users = results.map { |result| User.new(
      id: result['user_id'], 
      name: result['name'], 
      username: result['username'], 
      email: result['email'], 
      password: result['password']
    )}
  end  

  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end
end
